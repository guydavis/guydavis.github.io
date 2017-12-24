---
layout: post
title: Lane Detection on AKS
subtitle: deploying to azure
date: 2017-12-17
header-img: img/headers/prairie_view.jpg
comments: true
published: true
---

Similar to my [last post]({{ site.url }}/2017/11/24/lane_detect_cloud_gke/) on deploying to Kubernetes on Google Cloud Platform, this post will cover deploying [lane detection]({{ site.url }}/2017/09/25/lane_detect_video/) to Kubernetes on Microsoft's Azure.

## Create a Cluster
First, I created an account with Microsoft Azure and installed the Azure CLI on my Ubuntu laptop.  Then, after logging in to `az`, tried to [create a Kubernetes cluster](https://github.com/guydavis/lane-detect/tree/master/k8s/azure):

```
az aks create –g guy-azure -n lane-detect
```

Bang!  First error, not clear...  After checking the CLI help, the command seemed fine.  Perhaps Microsoft only likes CamelCase?

![Error]({{ site.url }}/img/posts/lane_detect_azure_create_error.png)

Nope, turned out I needed a ResourceGroup in an allowed Location first...

![Error]({{ site.url }}/img/posts/lane_detect_azure_create_rg.png)

Trying to create the cluster again failed with another error.

```
az aks create -g guy-azure -n lane-detect --kubernetes-version 1.8.1
```
Permissions?  

![Error]({{ site.url }}/img/posts/lane_detect_azure_create_error2.png)

After digging around on the Microsoft Azure web console for a while, I find that despite being a full administrator, I have to register for multiple different services...

![Error]({{ site.url }}/img/posts/lane_detect_azure_admin_perms.png)

After adding Microsoft.Compute, Microsoft.Storage, Microsoft.Network, I tried again. Same error.  Using [this debug command](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-manager-supported-services#azure-cli) I found that Microsoft.Network was still in-process of registering:

```
az provider list --query "[].{Provider:namespace, Status:registrationState}" --out table
```

Once I finally got the permissions I needed, I tried to create the cluster again.  This time success!

![AKS]({{ site.url }}/img/posts/lane_detect_azure_k8s_created.png)

Then, I used aks to get the kubectl configuration to check the connection to AKS:

```
az aks get-credentials -g guy-azure -n lane-detect --file k8s/azure/kubectl.config
kubectl --kubeconfig=k8s/azure/kubectl.config cluster-info
```

## Creating Persistent Storage
After creating an Azure Storage Resource, I used [Azure File Share](https://github.com/kubernetes/examples/tree/master/staging/volumes/azure_file) to share the source footage and processed videos within the cluster.  I could script the [creation of the Azure file share](https://docs.microsoft.com/en-us/azure/storage/files/storage-how-to-create-file-share#create-file-share-using-command-line-interface-cli) using the AZ CLI:
 so I guess I'll wait.
```
current_env_conn_string=$(az storage account show-connection-string -n guydavisazure -g guy-azure --query 'connectionString' -o tsv)
az storage share create --name myazurefiles --quota 200 --connection-string $current_env_conn_string 
```
Then, via the Azure console, I found the storage account name and access key, then base64 encoded them for the k8s secret.  Also created a k8s PV and PVC:
```
apiVersion: v1
kind: Secret
metadata:
  name: azure-secret
type: Opaque
data:
  azurestorageaccountname: $base64_user
  azurestorageaccountkey: $base64_password
---
apiVersion: v1
kind: PersistentVolume
metadata:
  name: myazurevolume
spec:
  capacity:
    storage: 200Gi
  accessModes:
  - ReadWriteMany
  azureFile:
    secretName: azure-secret
    shareName: myazurefiles
    readOnly: false
  claimRef:
    namespace: default
    name: myazureclaim
---
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: myazureclaim
spec:
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 200Gi
```

Kubernetes pods could then mount this shared storage as [ReadWriteMany](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes) with this YML snippet:
```
    ...
        volumeMounts:
        - name: myazureshare
          mountPath: /mnt
      volumes:
      - name: myazureshare
        persistentVolumeClaim:
          claimName: myazureclaim
```

## Transferring Video Data
I uploading the original dashcam footage, via my browser, in Azure Console.  An alternative would be to launch an Nginx or other container in k8s wih mounted volume and then used `kubectl cp`.  Unfortunately, you can't mount an [Azure File Share via SMB from a Linux system outside Azure](https://docs.microsoft.com/en-us/azure/storage/files/storage-how-to-use-files-linux), like my laptop.

![Upload]({{ site.url }}/img/posts/lane_detect_azure_upload.png)

## Creating Kubernetes Jobs

The batch job to process the dashcam footage:
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
        - name: myazureshare
          mountPath: /mnt
      restartPolicy: Never
      volumes:
      - name: myazureshare
        persistentVolumeClaim:
          claimName: myazureclaim
```
The lane detection jobs ran first time to completion, rendering processed video as expected.

![Overview]({{ site.url }}/img/posts/lane_detect_azure_k8s_overview.png)

Viewing the output footage in the Azure console:

![Output]({{ site.url }}/img/posts/lane_detect_azure_output.png)

And finally, here's a short example of processed dashcam footage:

<iframe width="560" height="315" src="https://www.youtube.com/embed/M91KB01VBNs" frameborder="0" gesture="media" allowfullscreen></iframe>
 
# Conclusions
Microsoft has come along way with Azure to compete with Amazon and Google, however I'm not sure they offer the best managed Kubernetes cluster:
* The k8s setup process on Azure seemed much longer than GCP, particularly completing pre-requisites, creating the k8s cluster, provisioning storage, and uploading dashcam footage.
* Once I figured out the Azure File Share approach, it did have the benefit of offering ReadWriteMany shares amongst the cluster.  Google's GCE disks are only ReadWriteOnce, requiring the deployment on a NFS share to get ReadWriteMany.

Overall, I'm pretty sold on the benefits of Kubernetes over other orchestrators such as DC/OS or Docker Swarm.  As well, I think managed Kubernetes services are the way to go over an on-premises deployment if you're allowed for your project.  Currently, GCP is my favorite managed k8s service.

## Next Steps

Having given the managed Kubernetes services at both Google and Microsoft I spin, I hope to try Amazon's offering next.  Unfortunately, AKS is currently only in preview... 

### More in this series...
* [Lane Detection in Images]({{ site.url }}/2017/05/21/py_lane_detect/) - first attempt.
* [Improved Lane Detection]({{ site.url }}/2017/06/13/lane_detect_improved/) - improved approach.
* [Handling Dashcam Footage]({{ site.url }}/2017/09/25/lane_detect_video/) - processing video.
* [Deploying in Docker]({{ site.url }}/2017/10/16/lane_detect_docker/) - bundling as a Docker image.
* [Running on Google Cloud]({{ site.url }}/2017/11/24/lane_detect_cloud_gke/) - scaling on GKE.
