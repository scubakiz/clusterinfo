# Change to the demo folder
cd ..\..\2_Intermediate\AntiAffinity

# Set Full Size Pods on Nodes page

# Create initial workloads
kubectl apply -k .\base

# Increase stateful set instances
kubectl apply -k .\step1

# Notice additional nodes are created

# Clean up
kubectl delete -k .\base