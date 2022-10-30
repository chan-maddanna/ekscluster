# Obtain role from cluster creation events


ROLE=$(aws cloudformation list-stack-resources  --stack-name $NG_STACK_NAME | jq -r '.[] | .[] | select(.LogicalResourceId == "NodeInstanceRole").PhysicalResourceId')

# Confirm role
echo $ROLE

# Create the policy
POLICY_ARN=$(aws iam create-policy \
    --policy-name AmazonEKSClusterAutoscalerPolicy \
    --policy-document \
'{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "autoscaling:DescribeAutoScalingGroups",
                "autoscaling:DescribeAutoScalingInstances",
                "autoscaling:DescribeLaunchConfigurations",
                "autoscaling:DescribeTags",
                "autoscaling:SetDesiredCapacity",
                "autoscaling:TerminateInstanceInAutoScalingGroup",
                "ec2:DescribeLaunchTemplateVersions"
            ],
            "Resource": "*",
            "Effect": "Allow"
        }
    ]
}' | jq -r '.[].Arn')

# Confirm policy arn
echo $POLICY_ARN

# Attach policy to the role
aws iam attach-role-policy \
--role-name $ROLE \
--policy-arn $POLICY_ARN

# Confirm role policies
aws iam list-attached-role-policies --role-name $ROLE
