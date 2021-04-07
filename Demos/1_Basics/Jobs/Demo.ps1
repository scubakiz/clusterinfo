# Change to the demo folder
cd ..\..\1_Basics\Jobs

# Create Job
kubectl apply -k .\step1

# Create Cron Job
kubectl apply -k .\step2

# Clean up
kubectl delete -k .\step1
kubectl delete -k .\step2