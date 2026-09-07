---
layout: post
title: "Autonomy for Drones"
subtitle: "using a companion computer without giving up flight safety"
date: 2026-08-22
background: /img/headers/grinell_glacier_hike4.jpg
comments: true
published: true
---

The simulation work in the last two posts established a useful boundary: ArduPilot is responsible for flying the aircraft, while external software can request goals and observe the result. This division is important. A companion computer should not replace the flight controller's stabilization, navigation, or failsafe systems just because it can send MAVLink messages.

For this experiment, I defined autonomy as a bounded decision loop. The companion program observes telemetry, chooses among a small set of actions, and hands those actions to the autopilot. It does not invent arbitrary motor outputs, and it does not continue operating when its view of the vehicle becomes stale.

## Three Layers of Responsibility

A simple architecture makes the ownership clear:

* **Flight controller:** Stabilization, sensor fusion, attitude control, arming rules, and configured failsafes.
* **Companion computer:** Mission logic, object or image processing, task-specific decisions, and health monitoring.
* **Operator:** Supervision, permission to test, and intervention when the system leaves its expected envelope.

The companion computer can request `GUIDED`, upload a waypoint, or ask the vehicle to return home. It should not assume that the request was accepted. Every transition needs confirmation from telemetry, and every long-running action needs a timeout.

## A Small State Machine

Rather than scattering mode changes and sleeps through a script, I represented the controller as explicit states:

```python
from enum import Enum, auto


class State(Enum):
    WAITING_FOR_HEARTBEAT = auto()
    READY = auto()
    TAKEOFF = auto()
    SEARCHING = auto()
    INSPECTING = auto()
    RETURNING_HOME = auto()
    COMPLETE = auto()
    ABORT = auto()
```

Each state has an entry condition, an action, and an exit condition. For example, `TAKEOFF` sends the takeoff request once, then waits until the reported relative altitude is within a tolerance. If telemetry stops arriving, the state does not wait forever; it moves to `ABORT` and asks the autopilot to apply the configured return or landing behavior.

The state machine is intentionally small. A dozen carefully defined states are easier to test than a clever planner with many implicit transitions. It is also easier to explain to an operator who needs to understand what the aircraft is doing.

## Health Before Intent

The autonomy loop should evaluate vehicle health before evaluating the mission objective. A simplified control loop might look like this:

```python
import time

TELEMETRY_TIMEOUT = 3.0


def choose_next_state(vehicle, current_state):
    if time.monotonic() - vehicle.last_heartbeat > TELEMETRY_TIMEOUT:
        return State.ABORT

    if not vehicle.is_armed and current_state not in {
        State.WAITING_FOR_HEARTBEAT,
        State.READY,
        State.COMPLETE,
    }:
        return State.ABORT

    if vehicle.battery_remaining is not None and vehicle.battery_remaining < 20:
        return State.RETURNING_HOME

    if vehicle.mode in {"LAND", "RTL"}:
        return State.RETURNING_HOME

    return current_state
```

This is not a complete safety system, but it captures the priority order. Lost communications, a low battery, or an unexpected flight mode should take precedence over finding the next target. A companion computer should fail toward a known aircraft behavior, not toward completing its assignment.

## Simulation as a Sensor Lab

A simulator is especially useful for autonomy because the same world can provide both camera input and ground truth. I can place a landing marker or inspection target in Gazebo, expose a camera stream to the companion process, and compare the detected location with the object's actual simulated position.

The test loop then becomes:

1. Spawn the target at a known position.
2. Fly the vehicle to a search area.
3. Process camera frames and produce a candidate target location.
4. Reject detections outside a confidence or distance threshold.
5. Request a short movement or inspection action.
6. Return home when the task is complete or a health check fails.

The fifth step is where restraint matters. A detection should not directly become an unrestricted flight command. It should be converted into a bounded goal, checked against altitude and geofence limits, and then sent through the same mission interface used by ordinary waypoints.

## Detection Is Not Understanding

Computer vision adds uncertainty that waypoint missions largely avoid. A detector may return a false positive, a stale frame, or a target that is partially outside the camera view. The controller needs to track that uncertainty explicitly.

Useful gates include:

* Require several consistent detections instead of acting on one frame.
* Reject detections with low confidence or excessive image motion.
* Attach a timestamp to every detection and discard old results.
* Limit the distance and altitude change of a single command.
* Return to a known point when the target is lost.

In simulation, these cases can be forced by moving the target, reducing visibility, or dropping camera messages. The goal is not to make the detector look perfect. The goal is to demonstrate that uncertain perception leads to a predictable response.

## Operator Control Remains Part of the Design

An autonomous mode still needs an operator-facing stop path. I kept a manual override available in the ground-control station and treated mode changes made outside the companion program as authoritative. If the operator switches to `RTL` or `LAND`, the controller stops issuing task commands and records the transition.

This also makes testing more honest. A system that can only succeed when nobody interrupts it has not demonstrated robust autonomy. A better test asks whether it can pause, resume, abort, and recover without leaving stale commands in its queue.

## The Limits of the Experiment

The simulated controller can validate state transitions, telemetry handling, command timeouts, and basic perception plumbing. It cannot certify a real aircraft or operating procedure. Wind, lighting, radio interference, sensor calibration, battery behavior, and the physical environment all need separate treatment.

For that reason, the next real-world step should be incremental: bench testing with propellers removed, then supervised manual flight, followed by a tightly bounded autonomous task in an approved area. The software should retain the same telemetry checks and abort paths used in simulation.

## Conclusion

The interesting part of drone autonomy is not issuing a takeoff command. It is deciding when not to issue the next command. A companion computer becomes useful when it can combine perception and mission logic while respecting the flight controller's authority, the operator's control, and the limits of its own information.

The simulation stack now gives me a place to exercise those decisions repeatedly. That is a much more useful foundation for future experiments than a script that happens to work once in a clear virtual sky.

### More in this series...
* [Drone Simulation](/2026/06/13/drone_simulation) - Installing and configuring a drone simulator.
* [Drone Simulation Testing](/2026/07/18/drone_simulation_testing) - Validating the drone simulation stack.
