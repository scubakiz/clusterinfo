# Change to the demo folder
cd Cron

read-host "Navigate to the Settings page."
read-host "Turn ON Micro Pods."
read-host "Navigate to the Deployments page."

read-host "Next Step - Creates initial workload and Cron KEDA scaler"
kubectl apply -k ./base

read-host "Observe pod replicas increase every 2nd minute and decrease every 4th minutes."

read-host "Next Step - Cleans up"
kubectl delete -k ./base
cd ..