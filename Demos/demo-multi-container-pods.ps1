# Change to the demo folder
Set-Location MultiContainerPods
. ".\CISendMessage.ps1"

read-host "Navigate to the Deployments Page"
SendMessageToCI "The following demo illustrates multi-container Pods." "Multi-Container Pods:" "Info"

read-host "Next Step - Creates a simple multi-container workload"
SendMessageToCI "kubectl apply -f multi-0-dep.yaml" "Kubectl command:" "Command"
kubectl apply -f multi-0-dep.yaml

read-host "Next Step - Creates multi-container workload with 1 container that doesn't start and 1 that fails after a while"
SendMessageToCI "kubectl apply -f multi-1-dep.yaml" "Kubectl command:" "Command"
kubectl apply -f multi-1-dep.yaml

read-host "Next Step - Creates a more complex multi-container workload with Init Containers"
SendMessageToCI "kubectl apply -f multi-2-dep.yaml" "Kubectl command:" "Command"
kubectl apply -f multi-2-dep.yaml

read-host "Click on any of the new pods to view Pod Details.  Watch the containers tabs."

read-host "Next Step - Cleans up"
SendMessageToCI "kubectl delete deploy multi-0-dep multi-1-dep multi-2-dep" "Kubectl command:" "Command"
kubectl delete deploy multi-0-dep multi-1-dep multi-2-dep
Set-Location ..