# Change to the demo folder
cd AffinityVolume

read-host "Navigate to the Settings page.  Turn on Mini Pods."
read-host "Navigate to the Nodes page."

read-host "Next Step - Creates initials workloads.  All will be on same node"
kubectl apply -k ./base

read-host "Next Step - Increases workload instances.  All still on same node"
kubectl apply -k ./step1

read-host "Next Step - Increases workload instances past limit.  Some will remain Pending even if there's room on other nodes."
kubectl apply -k ./step2

read-host "Next Step - Cleans up"
kubectl delete -k ./base
cd ..