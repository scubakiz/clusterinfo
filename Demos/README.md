# NEVER USE CLUSTER INFO IN A PRODUCTION CLUSTER!!

# Using Demos

There are several demos you can use to illustrate various Kubernetes concepts.   There are demos available as ***Powershell*** scripts.

The demos are designed to show one step at a time so you can see the progress before moving onto to the next step.

In the example below, each step waits for the user to press the **Enter** before proceeding.  The "Next Step" portions explain the next step the script will take.  They simple require you to press the **Enter** key to execute that step.  The others prompts are comments/directions for the instructor to follow.  

Example ***demo-basic-deployments.ps1*** script:

```powershell
Set-Location BasicDeployments
. ".\CISendMessage.ps1"

read-host "Navigate to the Deployments page"
SendMessageToCI "The following demo illustrates the basic Kubernetes deployments." "Basic Deployments:" "Info"

read-host "Next Step - Creates initial deployments"
SendMessageToCI "kubectl apply -f workload-1-dep-lime.yaml --record" "Kubectl command:" "Command"
kubectl apply -f workload-1-dep-lime.yaml --record
SendMessageToCI "kubectl apply -f workload-2-dep --record" "Kubectl command:" "Command"
kubectl apply -f workload-2-dep.yaml --record

...

read-host "Next Step - Undoes rollout to bring previous replica set back"
SendMessageToCI "kubectl rollout undo deploy workload-1-dep" "Kubectl command:" "Command"
kubectl rollout undo deploy workload-1-dep

read-host "Next Step - Undoes rollout back to Rev 1"
SendMessageToCI "kubectl rollout undo deploy workload-1-dep --to-revision=1" "Kubectl command:" "Command"
kubectl rollout undo deploy workload-1-dep --to-revision=1

...

read-host "Next Step - Cleans up"
SendMessageToCI "kubectl delete deploy workload-1-dep workload-2-dep" "Kubectl command:" "Command"
kubectl delete deploy workload-1-dep workload-2-dep
Set-Location ..
```

The other way to run the demos is load the scripts into **VS Code**, select each line to run and press **F8** to execute it.



# Available Demos

These demos are independent of each other and can be run in any order.

  * **Basic Deployments** - Shows a simple deployment with updates that cause new Replica Sets to be created.
  * **Services** - Shows the evolution of a Service from ClusterIP to NodePort to LoadBalancer
  * **Multi-container Pods** - Shows multi-container pods, including Init Containers.

More demos coming soon...