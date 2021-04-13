# Demos
There are various demos you can use to illustrate various Kubernetes concepts.  The demos  run one step one at a time so that you can see the progress.  

# Setup

### Please install the following components prior to running any of the demos:

It's a good idea to create a brand new cluster prior to going through the demos to ensure no existing resource interfere with expected behavior.

#### 1. Enable an AKS AutoScaler

Use the following command to create a customized AKS Autoscaler (update **resource-group** and cluster **name** first):

```
az aks update --resource-group __<resource group>__ --name __<cluster name>__  --enable-cluster-autoscaler --min-count 2 --max-count 5 --cluster-autoscaler-profile scale-down-unneeded-time=1m scale-down-delay-after-add=1m scale-down-unready-time=1m  skip-nodes-with-system-pods=false
```

#### 2. Install KEDA

Run this command to install the KEDA operator:

```
helm repo add kedacore https://kedacore.github.io/charts
kubectl create namespace keda
helm install keda kedacore/keda --namespace keda
```
