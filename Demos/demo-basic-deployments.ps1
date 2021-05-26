# Change to the demo folder
Set-Location BasicDeployments
. ".\CISendMessage.ps1"

read-host "Navigate to the Deployments page"
SendMessageToCI "The following demo illustrates the basic Kubernetes deployments." "Basic Deployments:" "Info"

read-host "Next Step - Creates initial deployments"
SendMessageToCI "kubectl apply -f workload-1-dep-lime.yaml --record" "Kubectl command:" "Command"
kubectl apply -f workload-1-dep-lime.yaml --record
SendMessageToCI "kubectl apply -f workload-2-dep --record" "Kubectl command:" "Command"
kubectl apply -f workload-2-dep.yaml --record

read-host "Next Step - Updates the deployment to trigger a new replica set"
SendMessageToCI "labels:\n  color: yellow" "Deployment YAML Changes:" "Code"
kubectl apply -f workload-1-dep-yellow.yaml --record

read-host "Next Step - Updates the deployment again making multiple Changes:"
SendMessageToCI "labels:\n  color: maroon" "Deployment YAML Changes:" "Code"
kubectl apply -f workload-1-dep-maroon.yaml --record

read-host "Observe and explain toolbar buttons."

read-host "Next Step - Undoes rollout to bring previous replica set back"
SendMessageToCI "kubectl rollout undo deploy workload-1-dep" "Kubectl command:" "Command"
kubectl rollout undo deploy workload-1-dep

read-host "Next Step - Changes color label to trigger a new replica set"
SendMessageToCI "labels:\n  color: pink" "Deployment YAML Changes:" "Code"
kubectl apply -f workload-1-dep-pink.yaml --record

read-host "Open the Deployment Info Panel by clicking the Info (i) icon to the right of the deployment name."

read-host "Next Step - Changes color label and INVALID image.  See what happenes with the new replica set"
SendMessageToCI "containers:\n- image: nginx:1.12345" "Deployment YAML Changes:" "Code"
kubectl apply -f workload-1-dep-aqua-invalid.yaml --record

read-host "Next Step - Undoes rollout to previous replica set"
SendMessageToCI "kubectl rollout undo deploy workload-1-dep" "Kubectl command:" "Command"
kubectl rollout undo deploy workload-1-dep

read-host "Next Step - Undoes rollout back to Rev 1"
SendMessageToCI "kubectl rollout undo deploy workload-1-dep --to-revision=1" "Kubectl command:" "Command"
kubectl rollout undo deploy workload-1-dep --to-revision=1

read-host "Next Step - Changes deployment strategy to Recreate"
SendMessageToCI "strategy:\n  type: Recreate" "Deployment YAML Changes:" "Code"
kubectl apply -f workload-1-dep-blue-recreate.yaml

read-host "Next Step - Changes deployment strategy to Rolling Update and sets Revision History"
SendMessageToCI "strategy:\n  type: RollingUpdate\nrevisionHistoryLimit: 2" "Deployment YAML Changes:" "Code"
kubectl apply -f workload-1-dep-orange-revision-history.yaml

read-host "Next Step - Cleans up"
SendMessageToCI "kubectl delete deploy workload-1-dep workload-2-dep" "Kubectl command:" "Command"
kubectl delete deploy workload-1-dep workload-2-dep
Set-Location ..