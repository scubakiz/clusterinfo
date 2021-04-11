# Cluster Info
In-cluster Kubernetes UI designed for teaching Kubernetes concepts.


# Installation:

Add the Helm repo:

```
helm repo add scubakiz https://clusterinfosa.blob.core.windows.net/helm/
```

Install the Helm chart:

```
helm install clusterinfo scubakiz/clusterinfo
```

Wait about 60 seconds for the app to start.  

Forward the service and the app from your local machine at http://localhost:5252:

```
kubectl port-forward svc/clusterinfo 5252:5252 -n clusterinfo
```

# Clean up
To remove Cluster Info from your cluster, uninstall the Helm chart:
```
helm uninstall clusterinfo
```

Remove the Helm repo:
```
helm repo remove scubakiz
```