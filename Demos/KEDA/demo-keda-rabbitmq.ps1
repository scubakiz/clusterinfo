# Change to the demo folder
cd RabbitMQ

read-host "Navigate to the Settings page."
read-host "Turn ON Micro Pods."
read-host "Navigate to the Deployments page."

read-host "Next Step - Creates initial workloads"
kubectl apply -k ./base

read-host "Wait until Rabbit workload is ready"

read-host "Load rabbit UI - In a background job"
Start-Job -Name rabbit -ScriptBlock { kubectl port-forward svc/rabbit-svc 15672 } 

read-host "Open a browser window and navigate to http://localhost:15672"
read-host "Observer SampleQueue on the Queues page"

read-host "Next Step - Loads Messages into queue"
kubectl apply -k ./step1

read-host "Observer about 500 message in SampleQueue on the Queues page"
read-host "Observer how slowly they're being processed"

read-host "Next Step - Creates KEDA autoscaler"
kubectl apply -k ./step2

read-host "Observer increase in pod replicas.  Show HPA Info (i) panel.  Observe Scale Down Stabilization Window."
read-host "Observer pod replica decrease as queued messages decrease"

read-host "Next Step - Cleans up"
Stop-Job -Name rabbit
Remove-Job -Name rabbit
kubectl delete -k ./base
kubectl delete -k ./step1
kubectl delete -k ./step2
cd ..