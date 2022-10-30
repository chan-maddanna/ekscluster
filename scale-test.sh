# Purpose: Create a simple pod example to demostrate scale-out

# Create a simple pod with nginx container
kubectl create deploy nginx --image nginx

# Confirm pod running
kubectl get pods -o wide

# Watch the status of nodes (in another window)
kubectl get nodes -o wide --watch

# Increase the number of replicas
kubectl scale deployment nginx --replicas=96

# Watch the pods running state with 96 replicas
kubectl get pods -o wide
