#!/bin/bash

# Remove Roles from DBAdmins Group
## To Get ResourceId of DB-Subnet 
DB_SUBNET_ID= $(az network vnet subnet show --resource-group My_CapstoneRG --vnet-name Capstone-vnet --name mydb-subnet --query id -o tsv)

# Remove the Reader role from the DBAdmins Group
GROUP_ID=$(az ad group show --group DBAdmins --query objectId -o tsv)

 az role assignment delete