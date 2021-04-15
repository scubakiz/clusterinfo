# Change to the demo folder
cd BlueGreenDeployments

read-host "Next Step - Creates initial blue workload and service"
kubectl apply -k ./base

read-host "Open the Services page"
read-host "Wait until the load balancer is created then open a browser to the external IP/port"
read-host "Notice the Blue image"
read-host "Keep the browser page open"

read-host "Next Step - Creates new green workload"
kubectl apply -k ./step1

read-host "Next Step - Switches the service to new workload"
kubectl apply -k ./step2

read-host "Open to the external IP/Port browser page.  "
read-host "Notice the image is still blue (allowing the current session to end)"
read-host "Open a different browser (like Firefox) and go to the external IP/Port page"
read-host "Notice the green image"

read-host "Next Step - Switches back to blue workload"
kubectl apply -k ./step3

read-host "Next Step - Deletes green workload"
read-host "This will force all browsers to switch to the blue image"
kubectl delete -k ./step1

read-host "Next Step - Clean up"
kubectl delete -k ./base
cd ..