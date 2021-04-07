# Change to the demo folder
cd ..\..\2_Intermediate\VerticalScaling

# Select Micro Pods

# Create initial workload
kubectl apply -k .\base

# Increase replica count
kubectl apply -k .\step1

# Clean up
kubectl delete -k .\base
