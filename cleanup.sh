# Detach the policy we had manually attached to the Cluster Role


aws iam detach-role-policy \
--role-name $ROLE \
--policy-arn $POLICY_ARN
# Confirm variable still set

echo $CLUSTER_NAME
# Delete cluster
eksctl delete cluster --name=$CLUSTER_NAME
