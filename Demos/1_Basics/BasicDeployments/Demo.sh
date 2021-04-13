# Change to the demo folder
cd 1_Basics/BasicDeployments

read -p "Navigate to the Deployments page"

read -p "Create initial deployment"
kubectl apply -k ./base

read -p "Update the template to trigger a new replica set"
kubectl apply -k ./step1

read -p "Open the Deployment Info Panel"
read -p "Changes color label and set MinReadySecond to slow down the next replica set"
kubectl apply -k ./step2

read -p "Undo rollout to bring previous replica set back 
kubectl rollout undo deploy workload-1-dep

# Change color label to trigger a new replica set
kubectl apply -k ./step3

# Undo rollout back to Rev 1 
kubectl rollout undo deploy workload-1-dep --to-revision=1

# Change deployment strategy to Recreate
kubectl apply -k ./step4

# Change deployment strategy to Rolling Update and Revision History
kubectl apply -k ./step5

# Clean up
kubectl delete -k ./base
cd ../../