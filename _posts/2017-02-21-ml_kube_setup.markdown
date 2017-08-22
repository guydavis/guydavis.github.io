---
layout: post
title: Kubernetes on CoreOS
subtitle: cluster setup on AWS
date: 2017-02-21
header-img: img/headers/bow_river.jpg
comments: true
published: true
---

This is a follow-on post to my earlier [orchestration overview]({{ site.url }}/2016/11/25/ent_orchestrators/).  I'll be exploring container management in a [Kubernetes](https://kubernetes.io/) cluster running on [Container Linux](https://coreos.com/os/docs/latest) (aka CoreOS) within [AWS](https://aws.amazon.com/).  

## Creating a Kubernetes Cluster
While there a lot of different ways to launch a cluster, I decided to get my hands dirty with this [guide from CoreOS](https://coreos.com/kubernetes/docs/latest/kubernetes-on-aws.html).  As all the computing horsepower will be in the cloud, I was using an old laptop running Ubuntu 16.04 to build and control the cluster with these local tools:
 
    # First install kube-aws from CoreOS
    curl -O -k -L https://github.com/coreos/kube-aws/releases/download/v0.9.4-rc.2/kube-aws-linux-amd64.tar.gz
    tar -xzvf kube-aws-linux-amd64.tar.gz && sudo mv linux-amd64/kube-aws
    rmdir linux-amd64 && rm -f kube-aws-linux-amd64.tar.gz
https://coreos.com/kubernetes/docs/latest/kubernetes-on-aws.html#download-kube-aws
    # Then latest kubectl from Google
    sudo curl -L -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

    # Finally, AWS CLI from Amazon
    sudo pip install --upgrade awscli
    aws configure

Setup within AWS Console involved:

* Choosing an AWS region.  I'm using the new ca-central-1 region.
* Creating an EC2 keypair that will be used for later access to the launched instances.
* Creating a KMS encryption key for managing the TLS access to the cluster.
* Preparing a S3 bucket to hold the kube-aws configuration files. I named it 'kube-adm'.

## Initializing the Cluster

Following the tutorial, I initialized the CloudFormation templates with this (IDs munged):

    kube-aws init --cluster-name=my-kube --external-dns-name=kube.guydavis.ca --region=ca-central-1 --availability-zone=ca-central-1a --key-name=ca-central-kube --kms-key-arn="arn:aws:kms:ca-central-1:333123456789:key/f524137d-xx53-434a-8b2c-4665d7e9zga024a"

## Launching the Cluster

When ready, the basic cluster of 3 t2.medium nodes can be created with:

    kube-aws up --s3-uri=s3://kube-adm

![up]({{ site.url }}/img/posts/kube_coreos_start.png)

This will result in 3 new instances appearing in your AWS Console:

![aws]({{ site.url }}/img/posts/kube_coreos_aws.png)

Be sure to set the public IP of the controller node to the DNS name you set earlier.  I did this in the admin console of my DNS provider:

![dns]({{ site.url }}/img/posts/kube_coreos_dns.png)

## Using the Cluster

Next step in the tutorial was to list the avialble nodes:

    kubectl --kubeconfig=kubeconfig get nodes

and follow the [intro tutorials](https://kubernetes.io/docs/user-guide/quick-start/) for Kubernetes.

## Growing the Cluster

I didn't try this step, but it is [discussed in the main tutorial](https://coreos.com/kubernetes/docs/latest/kube-aws-cluster-updates.html).

## Destroying the Cluster

    kube-aws node-pools destroy
    kube-aws destroy

## Summary
While this [kube-aws tool](https://coreos.com/kubernetes/docs/latest/kubernetes-on-aws.html#download-kube-aws) from CoreOS to build AWS CloudFormation scripts for Kubernetes cluster setup was nice, it's not clear to me why one would want to run their own Kubernetes cluster, other than for interest-sake (as above).  

With the availability of fully-hosted Kubernetes clusters from [Google Cloud](https://cloud.google.com/container-engine/),  [Microsoft Azure](https://docs.microsoft.com/en-us/azure/container-service/container-service-kubernetes-walkthrough), and [AWS Cloud](https://aws.amazon.com/quickstart/architecture/heptio-kubernetes/), it seems much easier to side-step all this setup and just use a pre-configured cluster.  In fact, that's what I'll be trying next...
 
### More in this series...
* [Apps at a Medium Pace]({{ site.url }}/2016/11/25/ent_orchestrators/)