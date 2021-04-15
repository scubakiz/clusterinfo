# Change to the demo folder
cd MultiContainerPods

read-host "Navigate to the Deployments Page"

read-host "Next Step - Creates multi-container workload with 1 container that doesn't start"
kubectl apply -k ./step1

read-host "Next Step - Creates a more complex multi-container workload with Init Containers"
kubectl apply -k ./step2

read-host "Click on any of the new pods to view Pod Details.  Watch the containers tabs."

read-host "Next Step - Cleans up"
kubectl delete -k ./step1
kubectl delete -k ./step2
cd ..