---
layout: post
title: Apps at a Medium Pace
subtitle: container orchestration in the enterprise
date: 2016-11-25
header-img: img/headers/milk_river.jpg
comments: true
published: false
---

# Big, Slow, and Risk-Averse
For those working at small companies, discussing the benefits of a slow adoption of orchestrated containers will come off sounding crazy.  Agile companies have been reaping the benefits of container-tooling like [Docker](https://www.docker.com/) and service-orchestrators like [Kubernetes](http://kubernetes.io/) for a couple of years now.

<img src="{{ site.url }}/img/posts/ent_orchest_slow.png" class="img-responsive" style="padding:10px; float:left;"/>
Unfortunately, for those of us in the *enterprise*, things unfold at a much different pace.  When building and selling products to very large companies, the excellence of your technical stack is often a low priority when compared to adherence to well-established policies and regulations.  For companies where tech adoption cycles are measured in years, not months or *heaven-forbid* weeks, a justifiable fear of falling for the latest tech fad will loom large over all decisions.

# Changes in the Enterprise Stack
Many tech departments in large organizations are coming off a decade-long successful transition to virtual machines (VMs) from bare metal servers. While improved, request times for VMs may still be weeks or even months.  Often the IT department will send a monthly "bill" out to you for each running VM they have provisioned.  VM uptime is generally not great.

## Deploying Containers
<img src="{{ site.url }}/img/posts/ent_orchest_containers.png" class="img-responsive" style="padding:10px; float:right; height:100px"/>
Into this comes the promise of containers, particularly when paired with a cloud-provider offering fast access to *cheap* VMs. On demand VMs are a breath of fresh air for R&D teams used to waiting and waiting for resources.  Adding infrastructure-as-code tools like [Terraform](https://www.terraform.io/) with CI/CD pipelines like [Jenkins](https://jenkins.io/), it's easy to start pushing out Docker images to a private registry.  Unfortunately, this new found speed of development can quickly outrun the comfort-level of compliance and security departments, resulting in them vetoing some or all such deployments.

## Clustered Workloads
Assuming that you're able to [clear all the hurdles](https://zwischenzugs.wordpress.com/2016/07/08/a-checklist-for-docker-in-the-enterprise/) of container deployment in the enterprise, you'll still need to manage interacting and dependent services across numerous containers.  Whether scaling traditional web-tier apps or newer microservices, managing their deployment in an automated manner is critical.

<img src="{{ site.url }}/img/posts/ent_orchest_docker_kubernetes.jpg" class="img-responsive" style="padding:10px; float:right; height:120px"/>
Container orchestration is a fast moving space, however [Docker](https://www.docker.com/) and [Kubernetes](http://kubernetes.io/) are looking like the current front-runners with the most community and industry momentum.  Docker DataCenter is commercial. [DC/OS](https://dcos.io/), built on [Marathon](https://mesosphere.github.io/marathon/) & [Mesos](https://mesos.apache.org/), shown below, is also promising:   

<img src="{{ site.url }}/img/posts/ent_orchest_dcos.png" class="img-responsive" style="border: 1px solid gray; padding:10px"/> 

Currently, these all have free community editions with optional [commercial add-ons](https://en.wikipedia.org/wiki/Open_core), which can be a benefit or concern depending on your viewpoint.  If you're not worried by cloud-provider lock-in, then [AWS](https://aws.amazon.com/), [Azure](https://azure.microsoft.com), and [GCP](https://cloud.google.com/) all offer dedicated services.

## Application Provider Platforms
To ease the development pipeline for your programmers, take a look at the application provider space (APaaS) including [Cloud Foundry](https://www.cloudfoundry.org/) and [Open Shift](https://www.openshift.com/).  I'm hearing good things about [Convox](https://convox.com/), [Deis](http://deis.io/), [Flynn](https://flynn.io/), and [Dokku](http://dokku.viewdocs.io/dokku/).

# Where to now?
With so many options, it's understandable that the enterprise is hesitant to make a serious commitment.  Ignoring these innovations however is not a good plan, so take the time to explore to find the best tools for your teams.  Let us know what you've found works by discussing it below.

 