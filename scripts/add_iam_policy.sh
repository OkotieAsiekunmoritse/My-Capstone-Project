#!/bin/bash


# Create IAM policy for DBAdmins to read DB Subnet info
POLICY_DOC=$(cat <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:DescribeSubnets",
        "ec2:DescribeVpcs"
      ],
      "Resource": "*"
    }
  ]
}
EOF
)

echo "$POLICY_DOC" > dbadmins-policy.json

aws iam create-policy --policy-name DBAdminsPolicy --policy-document file://dbadmins-policy.json


# Attach ReadOnlyAccess policy to DBAdmins
aws iam attach-group-policy --group-name DBAdmins --policy-arn arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess

