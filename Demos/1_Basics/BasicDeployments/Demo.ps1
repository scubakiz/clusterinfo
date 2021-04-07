# Change to the demo folder
cd ..\..\1_Basics\BasicDeployments

# Create initial workload
kubectl apply -k .\base

# Change color label to trigger a new replica set
kubectl apply -k .\step1

# Open the Deployment Info Panel
# Change color label and set minreadysecond to slow down deployment
kubectl apply -k .\step2

# Undo rollout to bring previous replica set back 
kubectl rollout undo deploy workload-dep

# Change color label to trigger a new replica set
kubectl apply -k .\step3

# Undo rollout back to Rev 1 
kubectl rollout undo deploy workload-dep --to-revision=1

# Change deployment strategy to Recreate
kubectl apply -k .\step4

# Change deployment strategy to Rolling Update and Revision History
kubectl apply -k .\step5

# Clean up
kubectl delete -k .\base