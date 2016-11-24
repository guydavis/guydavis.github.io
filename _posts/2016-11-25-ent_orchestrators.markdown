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
For those working at small companies, discussing the benefits of a slow adoption of orchestrated containers will come off sounding crazy.  Agile companies have been reaping the benefits of container-tooling like [Docker](https://www.docker.com/) and service-orchestrators like [Kubernates](http://kubernetes.io/) for a couple of years now.

<img src="{{ site.url }}/img/posts/ent_orchest_slow.png" class="img-responsive" style="padding:10px; float:left;"/>
Unfortunately, for those of us in the *enterprise*, things unfold at a different pace.  When building and selling products to very large companies, the excellence of your technical stack is often a low priority when compared to adherence to well-established policies and conventions.  For companies where tech adoption cycles are measured in years, not months or *heaven-forbid* weeks, a justifiable fear of falling for the latest tech fad will loom large over all decisions.

# Changes in the Enterprise Stack
Many tech departments in large organizations are just coming off a decade-long successful transition to virtual machines (VMs) from bare metal servers. While improved, request times for VMs may still be weeks or even months.  Often the IT department will send a monthly "bill" out to you for each running VM they have provisioned.  VM uptime is generally not great.

## Deploying Containers
<img src="{{ site.url }}/img/posts/ent_orchest_containers.png" class="img-responsive" style="padding:10px; float:right; height:100px"/>
Into this comes the promise of containers, particularly when paired with a cloud-provider offering fast access to *cheap* VMs. On demand VMs are a breath of fresh air for R&D teams used to waiting and waiting for resources.  Matching infrastructure-as-code tools like Terraform with CI/CD pipelines like Jenkins, it's easy to start pushing out Docker images to a private registry.  Unfortunately, this new found speed of development can [outrun the comfort-level](https://zwischenzugs.wordpress.com/2016/07/08/a-checklist-for-docker-in-the-enterprise/) of compliance and security departments, resulting in them vetoing some or all such deployments.

## Clustered Workloads


# Enterprise Options
This is a fast moving space, however Docker and Kubernetes are looking like the front-runners, with the most community and industry momentum.  DC/OS, based on Marathon & Mesos, is another contender.  Currently, these all have free community editions with optional [commercial add-ons](https://en.wikipedia.org/wiki/Open_core).   Related in the application provider space (APaaS), are Cloud Foundry and Open Shift. 
 