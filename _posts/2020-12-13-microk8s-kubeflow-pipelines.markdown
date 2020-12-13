---
layout: post
title: Pipelines on Kubeflow
subtitle: samples deployment
date: 2020-12-13
header-img: img/headers/maligne_lake2.jpg
comments: true
published: true
---

Each time I come back to Kubeflow, I perform a fresh install to get the latest.  Often, I find the [default install path](https://microk8s.io/docs/addon-kubeflow) errors out, so I go looking for a [workaround](https://github.com/ubuntu/microk8s/issues/1754#issuecomment-732230867).  Here's the latest as of early December 2020 for Ubuntu 20.04 running on a local server:

```
sudo snap install microk8s --classic --channel=latest/edge
export KUBEFLOW_HOSTNAME="http://<LOCAL_SERVER_IP_ADDR>:8081"
KUBEFLOW_DEBUG=true microk8s enable kubeflow
microk8s juju config dex-auth static-password=<NEW_PASSWORD>
microk8s.kubectl port-forward -n kubeflow service/istio-ingressgateway 8081:80 --address 0.0.0.0
```

While the Kubeflow dashboard forwarding is now working this month, unfortunately a new bug means you need to set a new password after enabling kubeflow before logging in as shown:

![Login via Port Forward]({{ site.url }}/img/posts/microk8s_kubeflow_pipelines_login.png)

To get to the dashboard:

![Kubeflow Dashboard]({{ site.url }}/img/posts/microk8s_kubeflow_pipelines_dashboard.png)

## Development Setup

Using the [sample Kubeflow pipelines](https://www.kubeflow.org/docs/pipelines/tutorials/build-pipeline/), I set up a local development environment on an old Windows 10 laptop.  First, I installed [Anaconda](https://www.anaconda.com/products/individual), then setup an isolated Python env within a Gitbash shell in VS Code, after enabling [Gitbash to read](https://stackoverflow.com/a/50332206) `.bash_profile`:

```
conda init bash
conda create --name mlpipeline python=3.7
conda activate mlpipeline
pip3 install kfp --upgrade
```

## Compiling a ML Pipeline

Executed the following to complile the [sample Kubeflow pipeline]:

```
git clone git@github.com:kubeflow/pipelines.git
cd pipelines
export DIR=./samples/core/sequential
dsl-compile --py ${DIR}/sequential.py --output ${DIR}/sequential.tar.gz
```

The compiled pipeline is then ready for upload to the Kubeflow cluster: `./samples/core/sequential/sequential.tar.gz`

## Deploying the Pipeline

![Pipeline Upload]({{ site.url }}/img/posts/microk8s_kubeflow_pipelines_upload.png)

After upload, the pipeline is shown both as a Graph and YAML:

![Pipeline Upload]({{ site.url }}/img/posts/microk8s_kubeflow_pipelines_upload_graph.png)

## Running the Pipeline

Clicking `Create Run` button allows for execution of the pipeline on the Kubeflow cluster.

![Pipeline Upload]({{ site.url }}/img/posts/microk8s_kubeflow_pipelines_run_create.png)

Output is shown soon after for a sample pipeline such as this:

![Pipeline Upload]({{ site.url }}/img/posts/microk8s_kubeflow_pipelines_run_graph.png)

While this upload process worked alright, I did prefer the Jupyter [notebook interactive approach]({{ site.url }}/2020/11/14/microk8s-kubeflow-mnist) for quickly trying out new ML code.

## Conclusions

While I've had some trouble getting a consistent working on-prem install of Kubeflow, once up and running it does seem to be worthwhile platform for ML deployments.  Beyond my lab experiments however, I'd probably recommend running it on a managed Kubernetes cluster such as GKE, AKS, or EKS in production.

### More in this series...
* [microk8s on ubuntu]({{ site.url }}/2020/04/24/ubuntu-microk8s) - Single instance cluster
* [microk8s upgraded]({{ site.url }}/2020/09/28/microk8s-upgrade) - Upgrading to k8s 1.19
* [kubeflow setup]({{ site.url }}/2020/10/18/microk8s-kubeflow-setup) - Enabling ML workflows
* [MNIST notebook]({{ site.url }}/2020/11/14/microk8s-kubeflow-mnist) - Using Jupyter notebooks on Kubeflow
