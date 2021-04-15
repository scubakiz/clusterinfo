# Change to the demo folder
cd .\CanaryDeployments

read-host "Open the Deployments page"

read-host "Next Step - Creates yellow and red workloads and service"
kubectl apply -k ./base

read-host "Open the Services page"
read-host "Observe how service can select either deployment"

read-host "Next Step - Clean up"
kubectl delete -k ./base
cd ..