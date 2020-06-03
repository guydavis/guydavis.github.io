---
layout: post
title: Improving on Kubectl
subtitle: trying the k9s cli
date: 2020-06-03
header-img: img/headers/icefields1.jpg
comments: true
published: false
---

After playing around [microk8s on ubuntu]({{ site.url }}/2020/04/21/ubuntu-microk8s) for a while using `kubectl`, I stumbled across an interesting alternative: [`k9s`](https://k9scli.io/)

k9s is an *interactive* CLI for managing k8s clusters and all their resources.  It's praised online as a powerful tool, though one with which you might shoot your own foot with.

## Installation

While not listed on the [k9s install guide](https://k9scli.io/topics/install/), on Ubuntu 20.04 it seems the fastest way to get k9s is via: `snap install k9s`

![Snap]({{ site.url }}/img/posts/microk8s-k9scli-snap.png)

## Basic Usage

### More in this series...
* [microk8s on ubuntu]({{ site.url }}/2020/04/21/ubuntu-microk8s) - Single instance cluster