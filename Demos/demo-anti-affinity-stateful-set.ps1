# Change to the demo folder
cd 2_Intermediate/AntiAffinityStatefulSet

read-host "Navigate to the Settings page.  Turn off Mini/Micro Pods so Full sized pods are shown."
read-host "Navigate to the Nodes page."

read-host "Next Step - Creates initial workloads of Stateful Set with 2 instances"
kubectl apply -k ./base

read-host "Next Step - Increase stateful set instances."
kubectl apply -k ./step1

read-host "Notice the events of the Pending pods.  Additional nodes are created to support them"

read-host "Next Step - Cleans up"
kubectl delete -k ./base
cd ../../
