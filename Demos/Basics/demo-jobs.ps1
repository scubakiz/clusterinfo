# Change to the demo folder
cd Jobs

read-host "Navigate to the Jobs page"

read-host "Next Step - Creates a Job"
kubectl apply -k ./step1

read-host "Next Step - Create a Cron Job"
kubectl apply -k ./step2

read-host "Click on the Cron Jobs tab.  Wait for new jobs to show up.  Will maintain history of past 2 jobs."

read-host "Next Step - Cleans up"
kubectl delete -k ./step1
kubectl delete -k ./step2
cd ..