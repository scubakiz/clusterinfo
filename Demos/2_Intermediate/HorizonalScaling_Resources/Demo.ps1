# Change to the demo folder
cd ..\..\2_Intermediate\HorizonalScaling_Resources

# Select Full-size pods and show Pod Resources

# Create initial workload
kubectl apply -k .\base

# Wait for Current Metrics to appear

# Create load workload
kubectl apply -k .\step1

# Wait for Current Metrics to increase

# Increase load instances
kubectl apply -k .\step2

# Create HPA
kubectl apply -k .\step3

# Decrease load instances
kubectl apply -k .\step4

# Remove load instances
kubectl delete deploy complex-web-load

# Add another metric to HPA
kubectl apply -k .\step5


# Clean up
kubectl delete -k .\base
kubectl delete -k .\step3
