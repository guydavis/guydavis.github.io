---
layout: post
title: MNIST with Kubeflow
subtitle: first time notebook
date: 2020-11-14
header-img: img/headers/maligne_lake1.jpg
comments: true
published: true
---

With [microk8s](https://microk8s.io/) [setup]({{ site.url }}/2020/10/18/microk8s-kubeflow-setup), I was ready to try out first time [workflow](https://www.kubeflow.org/docs/gke/gcp-e2e/) based upon the venerable MNIST image set.  

## Creating a Notebook Server
First off, I needed to launch a Jupyter Notebook on the Kubernetes cluster.  Following this [tutorial](https://www.kubeflow.org/docs/notebooks/setup/#create-a-jupyter-notebook-server-and-add-a-notebook), 

![Notebook Create]({{ site.url }}/img/posts/microk8s_kubeflow_mnist_notebook_create.png)

After a minute or so, the notebook shows as ready:

![Notebook Created]({{ site.url }}/img/posts/microk8s_kubeflow_mnist_notebook_created.png)

Clicking `Connect` takes opens the new Notebook:

![Notebook Opened]({{ site.url }}/img/posts/microk8s_kubeflow_mnist_notebook_opened.png)

## MNIST Sample Project

To verify the Notebook server is working, I tried a created Python3 workbook and pasted some [sample code](https://www.kubeflow.org/docs/notebooks/setup/#experiment-with-your-notebook):

![Sample Notebook]({{ site.url }}/img/posts/microk8s_kubeflow_mnist_notebook_sample_code.png)

![Sample Run]({{ site.url }}/img/posts/microk8s_kubeflow_mnist_notebook_sample_run.png)

Ignoring the deprecation errors, this sample downloaded a MNIST data set and ran a gradient descent training and output the accuracy value.  In my case: 0.9002.

### More in this series...
* [microk8s on ubuntu]({{ site.url }}/2020/04/24/ubuntu-microk8s) - Single instance cluster
* [microk8s upgraded]({{ site.url }}/2020/09/28/microk8s-upgrade) - Upgrading to k8s 1.19
* [kubeflow setup]({{ site.url }}/2020/10/18/microk8s-kubeflow-setup) - Enabling ML workflows
* [kubeflow pipelines]({{ site.url }}/2020/12/09/microk8s-kubeflow-pipelines) - Deploying pipelines on Kubeflow
