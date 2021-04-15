read-host "Prior running demo, update the secret with you connection infomation."
read-host "Ensure cluster is connected to Azure Log Analytics Workspace."

# Change to the demo folder
cd AzureLogAnalytics

read-host "Navigate to the Settings page."
read-host "Turn ON Mini Pods."
read-host "Navigate to the Deployments page."

read-host "Next Step - Creates initial workload"
kubectl apply -k ./base

read-host "Wait until all deployments are running.  Select the azla-workload-dep deployment"

read-host "Next Step - Creates load on system"
kubectl apply -k ./step1

read-host "Wait a few minutes until pod instances increase"

read-host "Next Step - Increases load on system"
kubectl apply -k ./step2

read-host "Wait a few minutes until pod instances increase even more"

read-host "Next Step - Removes load from system"
kubectl delete -k ./step1

read-host "Wait a few minutes until pod instances decrease"

read-host "Next Step - Cleans up"
kubectl delete -k ./base
cd ..