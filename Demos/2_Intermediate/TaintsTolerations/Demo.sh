# Change to the demo folder
cd ../../2_Intermediate/TaintsTolerations

# Select Mini Pods

# Create initial workloads
kubectl apply -k ./base

# Set Node ID
$Node = "aks-agentpool-35127589-vmss000004"

# Add color and Process label to Node
kubectl label node $Node color=lime
kubectl label node $Node allowedprocess=gpu

# Add Node Selector to Lime deployment
kubectl apply -k ./step1

# Add Taint to Node
kubectl taint node $Node onlyprocess=gpu:NoExecute

# Add Toleration to lime deployment
kubectl apply -k ./step2

# Clean up
kubectl delete -k ./base
kubectl label node $Node color-
kubectl label node $Node allowedprocess-
kubectl taint node $Node onlyprocess-