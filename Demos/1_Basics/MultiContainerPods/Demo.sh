# Change to the demo folder
cd ../../1_Basics/MultiContainerPods

# Create multi container workload
kubectl apply -k ./step1

# Create morce complex multi container workload
kubectl apply -k ./step2

# Clean up
kubectl delete -k ./step1
kubectl delete -k ./step2