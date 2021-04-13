# Change to the demo folder
cd 2_Intermediate/HorizonalScaling_Resources

read-host "Navigate to the Settings page."
read-host "Turn off Mini/Micro Pods so Full sized pods are shown."
read-host "Turn ON Show Pod Resources"
read-host "Navigate to the Deployments page."

read-host "Next Step - Creates initial workload"
kubectl apply -k ./base

read-host "Wait for Current Metrics to appear in each pod."

read-host "Next Step - Creates load workload"
kubectl apply -k ./step1

read-host "Wait for Current Metrics to increase in each pod."

read-host "Next Step - Increase load instances."
kubectl apply -k ./step2

read-host "Optional - Wait for Current Metrics to increase even more in each pod."

read-host "Next Step - Creates Horizontal Pod Autoscaler"
kubectl apply -k ./step3

read-host "Click on the Info (i) icon in the HPA to show Behaviors."
read-host "Wait for number of pods to stabalize."

read-host "Next Step - Decrease load instances"
kubectl apply -k ./step4

read-host "Wait for number of pods to decrease."

read-host "Next Step - Delete load instances"
kubectl delete deploy complex-web-load

read-host "Wait for number of pods to decrease down to 2.  Notice the orignal number of instances was 3."

read-host "Next Step - Add another metric to HPA to show it can support more than one."
kubectl apply -k ./step5

read-host "Next Step - Cleans up"
kubectl delete -k ./base
kubectl delete -k ./step3
cd ../../