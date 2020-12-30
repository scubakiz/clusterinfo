# Cluster Info
In-cluster Kubernetes UI - Meant for teaching Kubernetes concepts

# Available as Docker image
To install the app into your cluster, run this in the __default__ namespace:

``kubectl apply -f https://raw.githubusercontent.com/scubakiz/clusterinfo/main/clusterinfo.yaml``

To install it in the __demo__ namespace:

``kubectl apply -f https://raw.githubusercontent.com/scubakiz/clusterinfo/main/clusterinfo-demo.yaml``

To install it in any other namespace, download the yaml and change the namespace of the serviceAccount listed in the ClusterBinding.

Access the app from your local machine:

``kubectl port-forward svc/clusterinfo 5252``

Source code coming soon.
