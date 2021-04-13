# Change to the demo folder
cd ..\..\2_Intermediate\VerticalScaling

# Create initial workload
kubectl apply -k .\base

# Select Micro Pods

# Increase replica count
kubectl apply -k .\step1

# Clean up
kubectl delete -k .\base
