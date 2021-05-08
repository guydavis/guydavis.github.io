---
layout: post
title: GPU Passthru on Unraid
subtitle: what not to do...
date: 2021-02-02
header-img: img/headers/maligne_lake5.jpg
comments: true
published: true
---

**tldr;** In which I attempt to run ML pipelines in a Ubuntu 20.04 VM on Unraid. Passthrough to a VM running on Unraid does work, but not with really old GPUs!

# Background

After successfully [setting up Unraid]({{ site.url }}/2021/01/30/unraid-server-setup) on an old workstation, I thought it would be interesting to passthrough a GPU into a Ubuntu VM and run some ML pipelines.

Unraid offers [support for GPU passthrough](https://wiki.unraid.net/UnRAID_6/VM_Management#Assigning_Graphics_Devices_to_Virtual_Machines_.28GPU_Pass_Through.29) to VMs (and Docker containers) but it is notoriously finicky, often due to idiosyncrasies with motherboards, BIOSes, and GPUs.  In general, newer hardware is more likely to work, but AMD cards have [known issues](https://www.reddit.com/r/unRAID/comments/jfg0vr/passing_through_single_amd_gpu_vega_56/) and older hardware is really hit or miss.

In my case, I am attempting this with a 10-year old Nvidia Quadro 4000 card.  Yes, a decade old GPU...

# Guest VM

Launching a headless VM on Unraid running 20.04 was quite straight-forward.  Unraid offers a browser-based console-window on VM launch to allow text interaction with the installer.  I also used [TigerVNC](https://tigervnc.org/) viewer on Windows to connect afterward.

# CUDA Install

After experimenting with Ubuntu 20.04, I quickly discovered that the decade-old Nvidia Quadro 4000 in the Unraid host system meant that most recent CUDA version I could use was:

* Nvidia Driver [390.138](https://www.nvidia.com/Download/driverResults.aspx/160182/en-us)
* CUDA [9.2](https://docs.nvidia.com/cuda/cuda-toolkit-release-notes/index.html#cuda-major-component-versions)

So the old GPU meant I must use an old driver, which forced an old CUDA version. This old version was only compatible with Ubuntu 16.04, a 5-year old OS at this point.  Fine, I launched a new VM running 16.04...

# GPU Passthrough

With the Ubuntu VM setup, I connected to it using SSH, instead of VNC.  

```
sudo apt install build-essential
sudo ./NVIDIA-Linux-x86_64-390.138.run
sudo reboot
...
sudo ./cuda_9.2.148_396.37_linux.run
```

But CUDA refused to install so I checked to see if the GPU was recognized:

```
sudo apt install -y ubuntu-drivers-common
sudo ubuntu-drivers devices
```

In my case, this output details of an old Nvidia Quadro 4000 GPU:

```
== /sys/devices/pci0000:00/0000:00:02.4/0000:05:00.0 ==
modalias : pci:v000010DEd000006DDsv0000103Csd00000780bc03sc00i00
vendor   : NVIDIA Corporation
model    : GF100GL [Quadro 4000]
driver   : nvidia-340 - distro non-free
driver   : nvidia-driver-390 - distro non-free recommended
driver   : xserver-xorg-video-nouveau - distro free builtin
```

After confirming, that this old GPU [requires a legacy Nvidia driver](https://www.nvidia.com/Download/driverResults.aspx/160182/en-us), I went with the suggested install: 

```
sudo ubuntu-drivers autoinstall
```

So instead, I [downloaded the driver](https://www.nvidia.com/en-us/drivers/unix/) directly and SFTP'd it over to the Ubuntu VM, then installed it directly:

```
# First disable Nouveau
sudo bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
sudo bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
sudo update-initramfs -u
sudo reboot
lsmod | grep nou # check nouveau is not running
```

```
curl -O http://us.download.nvidia.com/XFree86/Linux-x86_64/390.138/NVIDIA-Linux-x86_64-390.138.run
chmod u+x NVIDIA-Linux-x86_64-390.138.run
sudo ./NVIDIA-Linux-x86_64-390.138.run
```

Unfortunately, this where the adventure ended as more searching revealed this [old card simply will not work](https://forums.unraid.net/topic/73225-quadro-4000-gpu-passthrough-bsod/?do=findComment&comment=674143).  

# Conclusion

While it was interesting to attempt this config, it's clear that a newer card will be required.  However, at the start of 2021 Etherium miners are snapping up every 8GB+ GPU, driving prices to silly levels.  So, I think patience is called for.  No rush and lots of other experiments to run...

### More in this series...
* [Unraid Server Setup]({{ site.url }}/2021/01/30/unraid-server-setup) - media and storage
* [Unraid Urbackup]({{ site.url }}/2021/03/15/unraid-urbackup) - household backups
* [Unraid Chia]({{ site.url }}/2021/04/30/unraid-chia-plotting-farming) - plotting and farming
