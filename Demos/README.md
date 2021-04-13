# NEVER USE CLUSTER INFO IN A PRODUCTION CLUSTER!!



# Setup

### Please install the following components prior to running any of the demos:

It's a good idea to create a brand new cluster prior to going through the demos to ensure no existing resource interfere with expected behavior.

#### 1. Enable an AKS Autoscaler

Use the following command to create a customized AKS Autoscaler (update **resource-group** and cluster **name** first):

```shell
az aks update --resource-group <resource group> --name <cluster name>  --enable-cluster-autoscaler --min-count 2 --max-count 5 --cluster-autoscaler-profile scale-down-unneeded-time=1m scale-down-delay-after-add=1m scale-down-unready-time=1m  skip-nodes-with-system-pods=false
```

#### 2. Install KEDA

Run this command to install the KEDA operator:

```shell
helm repo add kedacore https://kedacore.github.io/charts
kubectl create namespace keda
helm install keda kedacore/keda --namespace keda
```



# Using Demos

There are several demos you can use to illustrate various Kubernetes concepts.   There are demos available as ***Powershell*** scripts.

The demos are designed to show one step at a time so you can see the progress before moving onto to the next step.

In the example below, each step waits for the user to press the **Enter** before proceeding.  The "Next Step" portions explain the next step the script will take.  They simple require you to press the **Enter** key to execute that step.  The others prompts are comments/directions for the instructor to follow.  

Example ***demo-basic-deployments.ps1*** script:

```powershell
# Change to the demo folder
cd 1_Basics/BasicDeployments

read-host "Navigate to the Deployments page"

read-host "Next Step - Creates initial deployment"
kubectl apply -k ./base

read-host "Next Step - Updates the deployment to trigger a new replica set"
kubectl apply -k ./step1

read-host "Open the Deployment Info Panel by clicking the Info (i) icon to the right of the deployment name."

...

read-host "Next Step - Cleans up"
kubectl delete -k ./base
cd ../../
```

The other way to run the demos is load the scripts into **VS Code**, select each line to run and press **F8** to execute it.



# Available Demos

These demos are independent of each other and can be run in any order.

### Basics

  * **Basic Deployments** - Shows a simple deployment with updates that cause new Replica Sets to be created.
  * **Services** - Shows the evolution of a Service from ClusterIP to NodePort to LoadBalancer
  * **Multi-container Pods** - Shows multi-container pods, including Init Containers.
  * **Advanced Deployments** - Shows Blue/Green and Canary deployments with Services.
  * **Jobs** - Shows Jobs and Cron Jobs.



### Intermediate

  * **Affinity Volume** - Shows Pod Affinity being used to ensure all replicas containing a ***ReadWriteOnce*** volume are scheduled on the same node.
  * **Anti-Affinity Stateful Set**- Shows Pod Anti-Affinity being used to ensure instances of Pods in a ***Stateful Set*** are scheduled on different nodes.
  * **Horizonal Scaling (Resources)** - Shows an HPA controlling the number of replicas based on the Average Value of resource CPU metrics.
  * **Taints and Tolerations** - Shows Taints and Tolerations working together to control where different types of workloads are scheduled.
  * **Vertical Scaling** - Shows the AKS auto-scaler increase the number of Nodes based on the CPU requirements of a pod.



### Advanced

Coming soon...



### KEDA

  * **RabbitMQ** - Shows a KEDA created HPA control the number of replicas based on the number of messages in a RabbitMQ queue.
  * **Cron** - Show a KEDA created HPA automatically scale a deployment up and down based on a pre-defined schedule.
  * **Azure Log Analytics** - Shows a KEDA created HPA  query an Azure Log Analytics workspace to determine how to scale a workload.  The scaler reads the number of CPU Nano cores used by a different workload.  I.e. - The CPU load of one workload controls the number of replicas of another one using Azure Log Analytics workspace as a go-between.  This demo will soon be recreated for Prometheus.



More demos coming soon...