# Create EKS Managed Nodegroup


eksctl create nodegroup \
  --cluster $CLUSTER_NAME \
  --name $NG_NAME \
  --node-type t2.medium \
  --nodes 3 \
  --nodes-min 1 \
  --nodes-max 6
# Confirm creation status

eksctl get nodegroup --cluster $CLUSTER_NAME
