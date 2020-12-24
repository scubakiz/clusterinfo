# Cluster Info
In-cluster Kubernetes UI - Meant for teaching Kubernetes concepts

# Available as Docker image
To install the app into your cluster, run this in the desired namespace:

``kubectl apply -f https://github.com/scubakiz/clusterinfo/blob/main/clusterinfo.yaml``

Access the app from your local machine:

``kubectl port-forward svc/clusterinfo 5252``

Source code coming soon.
