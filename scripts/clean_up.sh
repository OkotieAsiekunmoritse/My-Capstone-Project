#!/bin/bash


# Detach policy
aws iam detach-group-policy --group-name DBAdmins --policy-arn arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess

# Remove users from groups
aws iam remove-user-from-group --user-name Tom --group-name WebAdmins
aws iam remove-user-from-group --user-name Jerry --group-name WebAdmins
aws iam remove-user-from-group --user-name Joseph --group-name DBAdmins
aws iam remove-user-from-group --user-name Mary --group-name DBAdmins

# Delete users
aws iam delete-user --user-name Tom
aws iam delete-user --user-name Jerry
aws iam delete-user --user-name Joseph
aws iam delete-user --user-name Mary

# Delete groups
aws iam delete-group --group-name WebAdmins
aws iam delete-group --group-name DBAdmins

# Delete VPC and subnets
aws ec2 delete-subnet --subnet-id $WEB_SUBNET_ID
aws ec2 delete-subnet --subnet-id $DB_SUBNET_ID
aws ec2 delete-vpc --vpc-id $VPC_ID

echo "Deletion Execution complete."
