# Change to the demo folder
cd 2_Intermediate/VerticalScaling

read-host "Navigate to the Settings page."
read-host "Turn ON Micro Pods."
read-host "Navigate to the Nodes page."

read-host "Next Step - Creates initial workload"
kubectl apply -k ./base

read-host "Observe how pods fit on existing nodes"

read-host "Next Step - Increases replica count"
kubectl apply -k ./step1

read-host "Observe how some pods can't be scheduled."
read-host "Examine the events on the Pending pods."
read-host "Wait a few minute for additional nodes to be added and availabe to the cluster."
read-host "Observe how Pending pods are automatically scheduled on new nodes."

read-host "Next Step - Cleans up"
kubectl delete -k ./base
cd ../../