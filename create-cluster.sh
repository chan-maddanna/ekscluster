# Purpose: Create EKS Cluster

# Configure AWS account credential
aws configure

# Setup variables for later reuse
if [ -z "$var" ];
	CLUSTER_NAME=new-eks-cluster
else
	CLUSTER_NAME=$1
fi
NG_NAME=my-mng
NG_STACK_NAME=eksctl-$CLUSTER_NAME-nodegroup-$NG_NAME

# Create an EKS cluster without nodegroup
eksctl create cluster \
    --name $CLUSTER_NAME \
    --without-nodegroup \
    --region us-east-1 \
    --zones=us-east-1c,us-east-1d,us-east-1f
# Confirm creation status

eksctl get cluster --name $CLUSTER_NAME
