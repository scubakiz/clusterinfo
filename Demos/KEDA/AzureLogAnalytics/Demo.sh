# Change to the demo folder
cd ../../KEDA/AzureLogAnalytics

# Create initial workload
kubectl apply -k ./base

# Create load on system
kubectl apply -k ./step1

# Increase load on system
kubectl apply -k ./step2

# Remove load
kubectl delete -k ./step1

# Clean up
kubectl delete -k ./base