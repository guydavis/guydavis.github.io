---
layout: post
title: GPU Passthru on Unraid
subtitle: what not to do...
date: 2021-01-31
header-img: img/headers/maligne_lake5.jpg
comments: true
published: false
---

Assumes:
* Will be working on a remote workstation and laptop and just need a Ubuntu Server with GPU.  Therefore no need for Ubuntu Desktop install along with X11 etc.

## Unraid Setup Overview

## Unraid VM Config

## Ubuntu Server VM

After experimenting with Ubuntu 20.04, I discovered that the decade-old Nvidia Quadro 4000 in the Unraid host system meant that most recent I could use was:

* Nvidia Driver [390.138](https://www.nvidia.com/Download/driverResults.aspx/160182/en-us)
* CUDA 9.2

## GPU Passthrough

With the Ubuntu VM setup, I'll be accessing it using SSH from now on, instead of VNC.  

```
sudo apt install build-essential
sudo ./NVIDIA-Linux-x86_64-390.138.run
sudo reboot
...
sudo ./cuda_9.2.148_396.37_linux.run




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

After confirming, that ths old GPU [requires a legacy Nvidia driver](https://www.nvidia.com/Download/driverResults.aspx/160182/en-us), I went with the suggested install: 

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


