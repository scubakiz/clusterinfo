# Change to the demo folder
Set-Location BasicDeployments

read-host "Navigate to the Deployments page"

read-host "Next Step - Creates initial deployment"
kubectl apply -k ./base --record

read-host "Next Step - Updates the deployment to trigger a new replica set"
kubectl apply -f ./step1/workload-1-dep.yaml --record

read-host "Observe and explain toolbar buttons."

read-host "Next Step - Set the deployment image to trigger a new replica set"
kubectl set image deploy workload-1-dep  workload=nginx:1.19 --record

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
Set-Location ..