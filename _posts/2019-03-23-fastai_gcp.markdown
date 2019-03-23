---
layout: post
title: Cloud GPUs
subtitle: machine learning by the hour
date: 2019-03-23
header-img: img/headers/cactus_flower.jpg
comments: true
published: false
---

 After confirming that my old Windows laptop was not a [machine-learning powerhouse]({{ site.url }}/2019/03/21/anaconda_navigator/), I decided to return to [Google Cloud Platform](https://cloud.google.com/) (GCP) to rent access to a GPU-powered server.  I also wanted to see how GCP had evolved since I'd last used [GKE in 2017]({{ site.url }}/2017/11/24/lane_detect_cloud_gke/).  For this, I followed the [Server setup](https://course.fast.ai/start_gcp.html) tutorial at [Fast AI](https://www.fast.ai/).

## GCloud CLI on Windows

Using the [WSL]({{ site.url }}/2019/02/28/windows_linux_subsystem) to run a Ubuntu Bash terminal, you can install and configure the GCloud CLI:

```
# Create environment variable for correct distribution
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"

# Add the Cloud SDK distribution URI as a package source
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Import the Google Cloud Platform public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# Update the package list and install the Cloud SDK
sudo apt-get update && sudo apt-get install google-cloud-sdk

# Then init gcloud, including login via browser for token
gcloud init
```

## GCloud Project Creation

Creating project can be done via the CLI or GCP admin console as shown here:

![GCP Console - New Project]({{ site.url }}/img/posts/fastai_gcp_new_project.png)

Once the new project is created, one can select it in `gcloud` with:

```
gcloud config set project fastai-12345
```

Replace `fastai-12345` above with your own project ID.

## GPU Instance on GCP

Creating an GPU-enabled instance in this new project to run ML notebooks can be done with:

```
gcloud compute instances create my-fastai-instance \
        --zone="us-west2-b" \
        --image-family="pytorch-latest-gpu" \
        --image-project=deeplearning-platform-release \
        --maintenance-policy=TERMINATE \
        --accelerator="type=nvidia-tesla-p4,count=1" \
        --machine-type=n1-highmem-8 \
        --boot-disk-size=200GB \
        --metadata="install-nvidia-driver=True" \
        --preemptible
```

By default, GPU instances are limited to 0, so you'll probably need to increase the limit to 1:

![Quota Error]({{ site.url }}/img/posts/fastai_gcp_gpu_quota.png)

If so, you can request an increase in the [GCP Console](https://console.cloud.google.com/iam-admin/quotas) as shown by filtering for:

![Quota Filter]({{ site.url }}/img/posts/fastai_gcp_gpu_quota_filter.png)

Then increasing on the right:
![Quota Increase]({{ site.url }}/img/posts/fastai_gcp_gpu_quota_increase.png)

You'll be told to wait a couple of days for the request to be approved.
