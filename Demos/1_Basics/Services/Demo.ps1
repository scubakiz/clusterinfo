# Change to the demo folder
cd C:\ClusterInfo\Demos\1_Basics\Services

# Create initial workload
kubectl apply -k .\base

# Change service to NodePort
kubectl apply -k .\step1

# Change service to LoadBalancer
kubectl apply -k .\step2

# Clean up
kubectl delete -k .\base