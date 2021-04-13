# Change to the demo folder
cd ..\..\1_Basics\AdvancedDeployments

# Create initial blue workload and service
kubectl apply -k .\base
read -p "Press any key to continue ..."

# Create new green workload
kubectl apply -k .\step1
read -p "Press any key to continue ..."

# Switch service to new workload
kubectl apply -k .\step2
read -p "Press any key to continue ..."

# Switch back to blue workload
kubectl apply -k .\step3
read -p "Press any key to continue ..."

# Delete gree workload - Will force switch to blue
kubectl delete -k .\step1

# Clean up
kubectl delete -k .\base
