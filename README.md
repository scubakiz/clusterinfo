# Kubernetes Cluster Info

In-cluster Kubernetes UI designed for teaching Kubernetes concepts.

![](ClusterInfo.png)

# NEVER USE CLUSTER INFO IN A PRODUCTION CLUSTER!!

# Installation:

Add the Helm repo and install the Helm chart:

```shell
helm repo add scubakiz https://scubakiz.github.io/clusterinfo/
helm repo update
helm install clusterinfo scubakiz/clusterinfo
```

Wait about a minute or so for the app to start.

Forward the service and the app from your local machine at http://localhost:5252:

```
kubectl port-forward svc/clusterinfo 5252:5252 -n clusterinfo
```

# Clean up

To remove Cluster Info from your cluster, uninstall the Helm chart:

```bash
helm uninstall clusterinfo
```

Remove the Helm repo:

```bash
helm repo remove scubakiz
```

#### Technologies Used

This application is written in C# using .NET 5.0 with Blazor.
