---
layout: post
title: MNIST with Kubeflow
subtitle: first time notebook
date: 2020-11-14
background: /img/headers/maligne_lake1.jpg
comments: true
published: true
---

With [microk8s](https://microk8s.io/) [setup](/2020/10/18/microk8s-kubeflow-setup), I was ready to try out first time [workflow](https://www.kubeflow.org/docs/gke/gcp-e2e/) based upon the venerable MNIST image set.  

## Creating a Notebook Server
First off, I needed to launch a Jupyter Notebook on the Kubernetes cluster.  Following this [tutorial](https://www.kubeflow.org/docs/notebooks/setup/#create-a-jupyter-notebook-server-and-add-a-notebook), 

<img src="/img/posts/microk8s_kubeflow_mnist_notebook_create.png" class="img-fluid" />

After a minute or so, the notebook shows as ready:

<img src="/img/posts/microk8s_kubeflow_mnist_notebook_created.png" class="img-fluid" />

Clicking `Connect` takes opens the new Notebook:

<img src="/img/posts/microk8s_kubeflow_mnist_notebook_opened.png" class="img-fluid" />

## MNIST Sample Project

To verify the Notebook server is working, I tried a created Python3 workbook and pasted some [sample code](https://www.kubeflow.org/docs/notebooks/setup/#experiment-with-your-notebook):

<img src="/img/posts/microk8s_kubeflow_mnist_notebook_sample_code.png" class="img-fluid" />

<img src="/img/posts/microk8s_kubeflow_mnist_notebook_sample_run.png" class="img-fluid" />

Ignoring the deprecation errors, this sample downloaded a MNIST data set and ran a gradient descent training and output the accuracy value.  In my case: 0.9002.

### More in this series...
* [microk8s on ubuntu](/2020/04/24/ubuntu-microk8s) - Single instance cluster
* [microk8s upgraded](/2020/09/28/microk8s-upgrade) - Upgrading to k8s 1.19
* [kubeflow setup](/2020/10/18/microk8s-kubeflow-setup) - Enabling ML workflows
* [kubeflow pipelines](/2020/12/09/microk8s-kubeflow-pipelines) - Deploying pipelines on Kubeflow
