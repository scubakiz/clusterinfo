# Change to the demo folder
cd ..\..\2_Intermediate\Affinity

# Set Mini Pods on.  Switch to Nodes page

# Create initial workloads
kubectl apply -k .\base

# Increase workload instances
kubectl apply -k .\step1

# Increase workload instances past limit
kubectl apply -k .\step2

# Clean up
kubectl delete -k .\base