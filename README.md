# rac-app Kubernetes Quickstart

## Prerequisites

- kubectl installed and configured
- Helm installed
- Access to your AKS cluster (or local cluster)

## 1. Start Kubernetes (AKS or local)

- For AKS: Ensure you are logged in and have the correct kubeconfig:
  ```sh
  az aks get-credentials --resource-group rac_app --name <aks-cluster-name>
  kubectl config use-context <aks-cluster-context>
  ```
- For local (e.g., minikube):
  ```sh
  minikube start
  kubectl config use-context minikube
  ```

## 2. Apply base manifests

Apply the manifests in the `k8s/` folder to set up base resources (e.g., Postgres, Kong, services):

```sh
kubectl apply -f k8s/
```

## 3. Deploy with Helm

- Install or upgrade the Helm chart:
  ```sh
  helm upgrade --install rac-app ./helm/rac-app -n rac-app --create-namespace -f ./helm/rac-app/values.yaml
  ```

## 4. Check pod status

```sh
kubectl get pods -n rac-app
```

## 5. Troubleshooting

- If you see namespace errors, delete and recreate the namespace:
  ```sh
  kubectl delete namespace rac-app
  kubectl create namespace rac-app
  ```
- If pods fail, check logs:
  ```sh
  kubectl logs -n rac-app <pod-name>
  ```

---

For more details, see the main project README or ask for specific service instructions.
