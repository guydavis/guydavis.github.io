---
layout: post
title: Kubeflow on MicroK8s
subtitle: machine learning setup
date: 2020-10-18
background: /img/headers/maligne_canyon2.jpg
comments: true
published: true
---

With [microk8s](https://microk8s.io/) [installed](/2020/04/21/ubuntu-microk8s) and [upgraded](/2020/09/28/microk8s-upgrade), I was ready to setup [Kubeflow](https://www.kubeflow.org/docs/about/kubeflow/).  Built upon Kubernetes, Kubeflow provides a consistent platform for ML workflows.

## Kubeflow Install
Following the install guides from both [Ubuntu](https://microk8s.io/docs/addon-kubeflow) and [Kubeflow](https://www.kubeflow.org/docs/started/workstation/getting-started-multipass/), I tried to enable Kubeflow with a single command: `microk8s enable kubeflow`.  Unfortunately, due to a [current defect](https://github.com/ubuntu/microk8s/issues/1439), one needs to switch to a candidate build instead:
```
sudo snap install microk8s --classic --channel=latest/candidate
KUBEFLOW_DEBUG=true microk8s enable kubeflow
```
The end of the enable step outputted a link leading to the Kubeflow dashboard.  I did have to put the [xip.io hostname into the hosts file](https://github.com/ubuntu/microk8s/issues/1140#issuecomment-660044973) of my laptop to browse to the site however:

<img src="/img/posts/microk8s_kubeflow_setup_login.png" class="img-fluid" />

Unfortunately, using a [hostname on my local network](https://github.com/ubuntu/microk8s/issues/817#issuecomment-609857923) didn't work with the default [IP range](https://metallb.universe.tf/configuration/) used by MetalLB within Microk8s.

### SSD FTW! 
As I am using an 10-year old workstation to play around with microk8s, my initial attempts to enable kubeflow all timed out with various errors.  Turned out that despite the workstation having 48 GB RAM and 24 CPU cores, it was stuck with only an old 2 TB hard disk @ 7200 RPM.  

Basically, k8s was completely hamstrung by such a slow disk. Adding a 40 $CDN Kingston SSD 240 GB drive to use as the root partition on a clean Ubuntu 20.04 install greatly increased system performance and allowed kubeflow to be successfully enabled.

## Kubeflow Dashboard

On logging in, the Kubeflow dashboard has a number of examples to get started with:

<img src="/img/posts/microk8s_kubeflow_setup_dashboard.png" class="img-fluid" />

Up next is a [first training session](/2020/11/14/microk8s-kubeflow-mnist) with Kubeflow...

### More in this series...
* [microk8s on ubuntu](/2020/04/24/ubuntu-microk8s) - Single instance cluster
* [microk8s upgraded](/2020/09/28/microk8s-upgrade) - Upgrading to k8s 1.19
* [MNIST notebook](/2020/11/14/microk8s-kubeflow-mnist) - Using Jupyter notebooks on Kubeflow
* [kubeflow pipelines](/2020/12/09/microk8s-kubeflow-pipelines) - Deploying pipelines on Kubeflow
