# Change to the demo folder
cd ../../KEDA/Cron

# Set Micro Pods on.  Switch to Deployments page

# Create initial workload and cron scaler
kubectl apply -k ./base

# Clean up
kubectl delete -k ./base