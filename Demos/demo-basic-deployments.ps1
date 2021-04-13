# Change to the demo folder
cd 1_Basics/BasicDeployments

read-host "Navigate to the Deployments page"

read-host "Next Step - Creates initial deployment"
kubectl apply -k ./base

read-host "Next Step - Updates the deployment to trigger a new replica set"
kubectl apply -k ./step1

read-host "Open the Deployment Info Panel by clicking the Info (i) icon to the right of the deployment name."

read-host "Next Step - Changes color label and set MinReadySecond to slow down the next replica set"
kubectl apply -k ./step2

read-host "Next Step - Undoes rollout to bring previous replica set back"
kubectl rollout undo deploy workload-1-dep

read-host "Next Step - Next Step - Changes color label to trigger a new replica set"
kubectl apply -k ./step3

read-host "Next Step - Undoes rollout back to Rev 1"
kubectl rollout undo deploy workload-1-dep --to-revision=1

read-host "Next Step - Changes deployment strategy to Recreate"
kubectl apply -k ./step4

read-host "Next Step - Changes deployment strategy to Rolling Update and sets Revision History"
kubectl apply -k ./step5

read-host "Next Step - Cleans up"
kubectl delete -k ./base
cd ../../