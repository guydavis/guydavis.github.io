---
layout: post
title: "Testing the Drone Simulation"
subtitle: "repeatable scenarios, telemetry checks, and mission control"
date: 2026-07-18
background: /img/headers/maligne_canyon5.jpg
comments: true
published: true
---

In my previous post, I assembled a local drone simulation using ArduPilot SITL and Gazebo Harmonic. Getting the simulated quadcopter into the air was satisfying, but a single successful takeoff does not tell us very much about the quality of an autonomous flight program.

The next step was to turn the simulator into a test bench. A useful test should be repeatable, observable, and able to fail without damaging hardware. That means starting from a known location, sending the same mission commands, recording telemetry, and checking the result against explicit expectations.

## From Demonstration to Test

A manual flight in MAVProxy is useful for confirming that the installation works. It is a poor regression test, however. The result depends on where the mouse is, which mode is active, and whether the previous simulation left a vehicle armed.

I split the process into four stages:

1. Start the simulated world and autopilot from a known configuration.
2. Wait for a heartbeat and verify the vehicle is in the expected mode.
3. Send a small mission with a known altitude and two or three waypoints.
4. Monitor telemetry until the vehicle finishes, times out, or enters a failsafe state.

The mission is intentionally boring. A rectangle at 10 metres above ground is enough to exercise arming, takeoff, waypoint navigation, position reporting, and landing. More complicated paths can be added after this basic scenario is reliable.

## A Small Telemetry Monitor

`pymavlink` exposes the same MAVLink messages that a companion computer would receive from a real flight controller. The following fragment waits for position updates and prints a compact progress line:

```python
import time
from pymavlink import mavutil

master = mavutil.mavlink_connection("udpin:127.0.0.1:14550")
master.wait_heartbeat(timeout=30)

started = time.monotonic()
timeout_seconds = 120

while time.monotonic() - started < timeout_seconds:
    message = master.recv_match(
        type=["GLOBAL_POSITION_INT", "HEARTBEAT", "STATUSTEXT"],
        blocking=True,
        timeout=2,
    )

    if message is None:
        print("No telemetry received")
        continue

    if message.get_type() == "GLOBAL_POSITION_INT":
        altitude = message.relative_alt / 1000.0
        latitude = message.lat / 10_000_000.0
        longitude = message.lon / 10_000_000.0
        print(f"alt={altitude:5.1f}m lat={latitude:.6f} lon={longitude:.6f}")

    elif message.get_type() == "STATUSTEXT":
        print(message.text)
```

A production script should also inspect the message severity, record timestamps, and stop waiting when the vehicle reports a critical error. The important part is the shape of the loop: commands are not considered successful merely because they were sent. The vehicle's reported state is the source of truth.

## Sending a Mission

MAVLink missions are uploaded as a sequence of mission items. Each item describes a command, frame, latitude, longitude, altitude, and any command-specific parameters. For a first test, I used a takeoff command, several `MAV_CMD_NAV_WAYPOINT` items, and a final landing command.

The coordinates should be generated around the simulated home position rather than copied from a real location. This keeps the test deterministic and prevents an accidental connection to a real vehicle from turning a development command into a flight command.

A useful mission runner performs these checks before upload:

* The connection has received a heartbeat.
* The reported vehicle type is the expected copter type.
* The current mode allows the requested operation.
* Every waypoint is inside the test area's geofence.
* The requested altitude is positive and below the experiment's limit.

After uploading, the runner waits for mission acknowledgements and watches `MISSION_CURRENT` and position messages. It should distinguish between the vehicle reaching the final waypoint and the process simply timing out.

## Making Failures Visible

The first versions of my script mostly printed whatever arrived on the MAVLink connection. That made it difficult to tell whether a test had passed. I changed the output into a small event log:

```text
2026-07-18T14:03:11Z CONNECTED system=1 component=1
2026-07-18T14:03:14Z MODE mode=GUIDED
2026-07-18T14:03:19Z ARMED
2026-07-18T14:03:32Z ALTITUDE value=10.1
2026-07-18T14:04:08Z WAYPOINT index=2
2026-07-18T14:04:51Z RESULT status=PASS
```

This is a small change, but it makes comparison between runs much easier. It also exposes a category of problems that are easy to miss in a graphical simulator: delayed heartbeats, unexpected mode changes, stale position data, or a vehicle that has stopped progressing through the mission.

For longer experiments, I would write the events and raw telemetry to a timestamped file and retain the simulator configuration alongside it. A test result without the exact parameters used to produce it is difficult to reproduce.

## What Simulation Cannot Prove

A passing SITL mission is evidence that the software behaved correctly in the simulated conditions. It is not evidence that the same mission is safe in the real world.

The simulation does not automatically capture every motor, battery, radio, compass, weather, or airframe problem. Its sensor models can also be more predictable than reality. Before any physical test, the mission needs a separate review of the aircraft, firmware parameters, operating area, regulatory requirements, and human supervision plan.

Simulation is still extremely valuable. It lets me exercise the control flow repeatedly, test the unhappy paths, and make mistakes while the vehicle is made of pixels. That is exactly the right place to discover that a timeout handler is missing or that a mode transition was assumed rather than verified.

## Conclusion

The useful unit of progress is no longer "the drone took off." It is "the same mission can be run repeatedly, its state can be observed, and failure produces a controlled outcome." That gives the autonomy work a foundation that can be measured instead of guessed.

Next I want to move the decision-making out of the mission script and into a small companion-computer controller. The controller will have to decide what to do from telemetry, while still allowing the autopilot to enforce the fundamental flight and safety constraints.

### More in this series...
* [Drone Simulation](/2026/06/13/drone_simulation) - Installing and configuring a drone simulator.
* [Drone Autonomy](/2026/08/22/drone_autonomy) - Exploring autonomous flying with the drone simulation.
