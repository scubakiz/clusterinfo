# Change to the demo folder
cd 2_Intermediate/TaintsTolerations

read-host "Navigate to the Settings page."
read-host "Turn ON Mini or Micro Pods."
read-host "Navigate to the Nodes page."

read-host "Next Step - Creates initial workloads"
kubectl apply -k ./base

read-host "Enter the Node Name of one node:" selectedNode
# For Powershell, set to one of the nodes in your cluster: 
# $selectedNode = "aks-agentpool-35127589-vmss000004"

read-host "Next Step - Adds color and Process label to Node"
kubectl label node $selectedNode color=lime
kubectl label node $selectedNode allowedprocess=gpu

read-host "Notice the color box appear in the Node"

read-host "Next Step - Adds Node Selector to Lime deployment"
kubectl apply -k ./step1

read-host "Wait for all the Lime pods to be rescheduled on the selected node"

read-host "Next Step - Adds Taint to Node"
kubectl taint node $selectedNode onlyprocess=gpu:NoExecute

read-host "Wait for ALL pods to be evicted from selected node."

read-host "Observe how Lime pods cannot be scheduled.  Examine their events."

read-host "Next Step - Adds Toleration to Lime deployment"
kubectl apply -k ./step2

read-host "Observe how only the Lime pods are scheduled on selected node and all others are on other nodes."

read-host "Next Step - Cleans up"
kubectl delete -k ./base
kubectl label node $Node color-
kubectl label node $Node allowedprocess-
kubectl taint node $Node onlyprocess-
cd ../../