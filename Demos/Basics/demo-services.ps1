# Change to the demo folder
cd Services

read-host "Navigate to the Services page"

read-host "Next Step - Create initial workload with a ClusterIP service"
kubectl apply -k ./base

read-host "Next Step - Upgrades the service to a NodePort"
kubectl apply -k ./step1

read-host "Next Step - Upgrades the service to a LoadBalancer"
kubectl apply -k ./step2

read-host "Wait about a minute or two for the external IP to be available and active."
read-host "Click on the external IP to bring up the website."
read-host "Watch the website as it refreshes, showing how it reaches a different pod after refresh (internal load balancer working)."

read-host "Next Step - Cleans up"
kubectl delete -k ./base
cd ..