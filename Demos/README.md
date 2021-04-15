# NEVER USE CLUSTER INFO IN A PRODUCTION CLUSTER!!

# Using Demos

There are several demos you can use to illustrate various Kubernetes concepts.   There are demos available as ***Powershell*** scripts.

The demos are designed to show one step at a time so you can see the progress before moving onto to the next step.

In the example below, each step waits for the user to press the **Enter** before proceeding.  The "Next Step" portions explain the next step the script will take.  They simple require you to press the **Enter** key to execute that step.  The others prompts are comments/directions for the instructor to follow.  

Example ***demo-basic-deployments.ps1*** script:

```powershell
# Change to the demo folder
cd BasicDeployments

read-host "Navigate to the Deployments page"

read-host "Next Step - Creates initial deployment"
kubectl apply -k ./base

read-host "Next Step - Updates the deployment to trigger a new replica set"
kubectl apply -k ./step1

read-host "Open the Deployment Info Panel by clicking the Info (i) icon to the right of the deployment name."

...

read-host "Next Step - Cleans up"
kubectl delete -k ./base
cd ..
```

The other way to run the demos is load the scripts into **VS Code**, select each line to run and press **F8** to execute it.



# Available Demos

These demos are independent of each other and can be run in any order.

  * **Basic Deployments** - Shows a simple deployment with updates that cause new Replica Sets to be created.
  * **Services** - Shows the evolution of a Service from ClusterIP to NodePort to LoadBalancer
  * **Multi-container Pods** - Shows multi-container pods, including Init Containers.

More demos coming soon...