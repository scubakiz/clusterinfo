# Change to the demo folder
cd ..\..\KEDA\RabbitMQ

# Set Mini Pods on.  Switch to Deployments page

# Create initial workloads
kubectl apply -k .\base

# Wait until workload turns green

# Load rabbit UI - in a separate window
kubectl port-forward svc/rabbit-svc 15672

# Observer queue

# Load Messages into queue
kubectl apply -k .\step1

# Observer queue

# Create KEDA autoscaler
kubectl apply -k .\step2

# Clean up
kubectl delete -k .\base
kubectl delete -k .\step1
kubectl delete -k .\step2