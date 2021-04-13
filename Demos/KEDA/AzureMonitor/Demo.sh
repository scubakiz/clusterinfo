# Change to the demo folder
cd ..\..\KEDA\AzureMonitor

# Create initial workload
kubectl apply -k .\base


# Clean up
kubectl delete -k .\base