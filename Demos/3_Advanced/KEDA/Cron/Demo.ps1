# Change to the demo folder
cd ..\..\3_Advanced\KEDA\Cron

# Set Micro Pods on.  Switch to Deployments page

# Create initial workload and cron scaler
kubectl apply -k .\base

# Clean up
kubectl delete -k .\base