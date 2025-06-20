#!/bin/bash

# Set variables
VPC_CIDR="10.0.0.0/16"
WEB_SUBNET_CIDR="10.0.1.0/24"
DB_SUBNET_CIDR="10.0.2.0/24"
REGION="us-east-1"


# Create a Virtual Private Cloud
VPC_ID=$(aws ec2 create-vpc \
    --cidr-block 10.0.0.0/16 \
    --region us-east-1 \
    --query "Vpc.VpcId" \
    --output text)

# Tag the VPC (like a resource group label)
aws ec2 create-tags --resources $VPC_ID \
    --tags Key=Name,Value=MyCapstone_vpc


# Create Web Subnet
WEB_SUBNET_ID=$(aws ec2 create-subnet \
    --vpc-id $VPC_ID \
    --cidr-block 10.0.1.0/24 \
    --availability-zone us-east-1a\
    --query "Subnet.SubnetId" \
    --output text)

aws ec2 create-tags --resources $WEB_SUBNET_ID \
    --tags Key=Name,Value=Web-Subnet

echo "Web Subnet ID: $WEB_SUBNET_ID"

# Create DB Subnet
DB_SUBNET_ID=$(aws ec2 create-subnet \
    --vpc-id $VPC_ID \
    --cidr-block 10.0.2.0/24 \
    --availability-zone us-east-1a \
    --query "Subnet.SubnetId" \
    --output text)

aws ec2 create-tags --resources $DB_SUBNET_ID \
    --tags Key=Name,Value=DB-Subnet

echo "DB Subnet ID: $DB_SUBNET_ID"