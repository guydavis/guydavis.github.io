---
layout: post
title: Lane Detection on GKE
subtitle: scaling on kubernetes
date: 2017-11-24
background: /img/headers/prairie_view.jpg
comments: true
published: true
---

After [bundling the lane detection algorithm into a Docker container](/2017/10/25/lane_detect_docker/), it's now time to run against more dashcam footage.  This post will cover deploying on [GKE](https://cloud.google.com/kubernetes-engine/), Google's managed [Kubernetes](https://kubernetes.io/) service.  The goal will be to process videos in parallel on multiple workers.

## Create a Cluster
Following my [earlier GKE](/2017/03/06/kube_gke/) post, I set up a fresh k8s cluster on GKE.  In this case, the default set of three small VMs was adequate for basic testing.

```
gcloud container clusters create gke-lane-detect --num-nodes=3
```

## Creating Persistent Storage
Given that my lane detection Docker container reads from and writes to a Docker volume, I faced a problem with GKE only supporting ReadWriteOnce persistent volumes.  As an alternative, I was able to [deploy an NFS server](https://github.com/guydavis/lane-detect/blob/master/k8s/gcp/01-dep-nfs.yml) in the k8s cluster, providing shared read/write storage to all workers.
```
gcloud compute disks create --size=200GB gke-nfs-disk
```
With the GCE disk created, the next step was to create a [PersistentVolume and PersistentVolumeClaim](https://github.com/guydavis/lane-detect/blob/master/k8s/gcp/03-pv-and-pvc-nfs.yml) within the k8s cluster. 

```
apiVersion: v1
kind: PersistentVolume
metadata:
  name: nfs
spec:
  capacity:
    storage: 1Mi
  accessModes:
    - ReadWriteMany
  nfs:
    server: NFS_IP
    path: "/"
```

Most importanly, this PV is of type NFS with access mode ReadWriteMany, unlike a plain old GCE disk mounted in GKE which is only of type ReadWriteOnce.  

<img src="/img/posts/lane_detect_gke_pv_nfs.png" class="img-fluid" /> 

This will allow multiple k8s workers to write to the NFS share at the same time as they split up processing of the dashcam video files.

## Transferring Video Data
With the [NFS service](https://github.com/guydavis/lane-detect/blob/master/k8s/gcp/02-srv-nfs.yml) started, I copied up about 4 GB of sample dashcam footage from my laptop to the NFS pod:
```
nfs_pod=$(kubectl get pods | grep nfs-server | cut -d ' ' -f 1)
kubectl cp ./videos $nfs_pod:/exports/videos
```
Using `kubectl exec`, I checked on the uploaded videos:
<img src="/img/posts/lane_detect_gke_input_video.png" class="img-fluid" /> 

## Creating Kubernetes Jobs
With the dashcam footage ready on the NFS server in the k8s cluster, the next step was to create a set of [lane detection](https://github.com/guydavis/lane-detect/blob/master/lane_detect.py) workers as seen in this [k8s resource spec](https://github.com/guydavis/lane-detect/blob/master/k8s/gcp/04-job-lane-detect.yml):

```
apiVersion: batch/v1
kind: Job
metadata:
  name: lane-detect
spec:
  parallelism: 3
  template:
    metadata:
      name: lane-detect
    spec:
      containers:
      - name: lane-detect
        image: guydavis/lane-detect
        workingDir: /mnt
        command: [ "/usr/bin/python3", "-u", "/opt/lane_detect.py" ]
        args: [ "videos/" ]
        imagePullPolicy: Always
        volumeMounts:
        - name: my-pvc-nfs
          mountPath: "/mnt"
      restartPolicy: Never
      volumes:
      - name: my-pvc-nfs
        persistentVolumeClaim:
          claimName: nfs
```

This job worked on the mounted `videos` directory, processing dashcam files in a random order, skipping over those already processed by other workers.  With `parallelism` set to 3, all workers in the Kubernetes cluster are involved, reaching completion much faster than a standalone system.

# Conclusions
Deploying this batch workload on Kubernetes was an interesting exercise that demonstrated the benefits of parallel execution.  With the easy scalability of GKE, this is a promising avenue for future performance gains.  

<img src="/img/posts/lane_detect_gke_node_status.png" class="img-fluid" /> 

I found both the GKE (above) and GCP (below) admin consoles handy for monitoring CPU usage as processing occurred:

<img src="/img/posts/lane_detect_gcp_node_status.png" class="img-fluid" /> 

And finally, here's a short example of processed dashcam footage:

<iframe width="560" height="315" src="https://www.youtube.com/embed/M91KB01VBNs" frameborder="0" gesture="media" allowfullscreen></iframe>
 
## Next Steps
While this approach demonstrated lane detection using Kubernetes to scale, there are a number of places for further improvements:
1. Obviously, improving the algorithm and its Python implementation could yield the biggest gains.
2. Next would be the NFS-based data pipeline, which may become a bottleneck with higher numbers of workers.  Alternatives such as GlusterFS and HDFS may be promising.
3. Finally, once the improvements above have already been made, one can scale up the k8s cluster to throw more compute resources at the problem.

### More in this series...
* [Lane Detection in Images](/2017/05/21/py_lane_detect/) - first attempt.
* [Improved Lane Detection](/2017/06/13/lane_detect_improved/) - improved approach.
* [Handling Dashcam Footage](/2017/09/25/lane_detect_video/) - processing video.
* [Deploying in Docker](/2017/10/16/lane_detect_docker/) - bundling as a Docker image.
* [Running on Microsoft Cloud](/2017/12/17/lane_detect_cloud_azure/) - scaling on Azure.
