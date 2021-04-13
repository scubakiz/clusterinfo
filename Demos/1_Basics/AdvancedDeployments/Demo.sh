# Change to the demo folder
cd 1_Basics/AdvancedDeployments

read -p "Create initial blue workload and service"
kubectl apply -k ./base

read -p "Open the Services page"
read -p "Wait until the load balancer is created then open a browser to the external IP/port.  Notice the Blue image."
read -p "Keep the browser page open."

read -p "Create new green workload"
kubectl apply -k .\step1

read -p "Switch the service to new workload"
kubectl apply -k .\step2
read -p "Open to the external IP/Port browser page.  Notice the image is still blue (allowing the current session to end)."
read -p "Open a different browser (like Firefox) and go to the external IP/Port page.  Notice the green image."

read -p "Switch back to blue workload."
kubectl apply -k .\step3

read -p "Delete green workload.  This will force all browsers to switch to the blue image".
kubectl delete -k .\step1

read -p "Clean up."
kubectl delete -k .\base
cd ../../