---
layout: post
title: Upgrading Microk8s
subtitle: 1.18 to 1.19
date: 2020-09-28
header-img: img/headers/icefields1.jpg
comments: true
published: true
---

During June, I installed [microk8s 1.18]({{ site.url }}/2020/04/21/ubuntu-microk8s), but then spent most of our warm Rockies summer in the mountains hiking and camping.  After getting back to it in September, I wanted to upgrade from Kubernetes 1.18 to 1.19.  However with microk8s, [upgrades are not supported](https://microk8s.io/docs/setting-snap-channel) - specifically see the "Changing channels" section. 

Of course, microk8s is not intended for anything more than trial/test/lab workflows so a full re-install should be expected.  First step is to remove the old install:

```
sudo snap remove microk8s
```

Then I performed the fresh install, this time to version 1.19:

```
sudo snap install microk8s --classic --channel=1.19/stable
sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube
tee -a ~/.bash_aliases <<<EOF
alias kubectl='microk8s kubectl'
EOF
su - $USER
microk8s status --wait-ready
kubectl cluster-info
kubectl get services
```

Then deploy the dashboard and make it available from my laptop:

```
microk8s enable dns storage dashboard ingress 
kubectl label service/kubernetes-dashboard kubernetes.io/cluster-service=true --namespace kube-system
kubectl cluster-info
sudo microk8s.kubectl proxy --accept-hosts=.* --address=0.0.0.0 &
sudo microk8s.kubectl -n kube-system edit deploy kubernetes-dashboard -o yaml
> In editor, add '- --enable-skip-login' line after '- --namespace=kube-system'
```

Then browse to: 

```
http://{IP_address}:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/
```

and click the `Skip` button:

![Skip]({{ site.url }}/img/posts/microk8s_upgrade_skip.png)

to see the dashboard:

![Dashboard]({{ site.url }}/img/posts/microk8s_upgrade_dashboard.png)

Back in business with a fresh install of microk8s 1.19.

### More in this series...
* [microk8s on ubuntu]({{ site.url }}/2020/04/24/ubuntu-microk8s) - Single instance cluster
* [kubeflow setup]({{ site.url }}/2020/10/18/microk8s-kubeflow-setup) - Enabling ML workflows
* [MNIST workflow]({{ site.url }}/2020/11/14/microk8s-kubeflow-mnist) - A first time ML workflow
