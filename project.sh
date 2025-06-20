!#/bin/bash

# Variable names
RESOURCE_GROUP="My_CapstoneRG"
LOCATION="eastus"
VNET_NAME="Capstone-vnet"
SUBNET_WEB="myweb-subnet"
SUBNET_DB="mydb-subnet"

# Address range assigned
VNET_ADDRESS="10.1.0.0/16"
WEB_ADMINS="10.1.1.0/24"
DB_ADMINS="10.1.2.0/24"

# Group names for Active Directories
WEB_ADMINS="WebAdmins"
DB_ADMINS="DBAdmins"

# Create a Resource Group
az group create --name My_CapstoneRG --location eastus

# Create a Virtual Network and a Web-Subnet
az network vnet create --resource-group My_CapstoneRG --name Capstone-vnet --address-prefix 10.1.0.0/16 --subnet-name myweb-subnet --subnet-prefix 10.1.1.0/24

#Create a DB-Subnet
az network vnet subnet create --resource-group My_CapstoneRG --vnet-name Capstone-vnet --name mydb_subnet --address-prefix 10.1.2.0/24

# Create Security Group called WebAdmins group
az ad group create --display-name "WebAdmins" --mail-nickname "WebAdmins"

# Create Security Group called DBAdmins group
az ad group create --display-name "DBAdmins" --mail-nickname "DBAdmins"

# Assign Reader Role to DBAdmins for DB subnet resources
## Firstly, get the Object ID for the DBAdmins group
az ad group show --group DBAdmins --query id -o tsv

### Secondly, get the Resource ID(Scope) of the DB-Subnet
az network vnet subnet show --resource-group My_CapstoneRG --vnet-name Capstone-vnet --name mydb_subnet --query id -o tsv

# Assign Reader role to the DbAdmin
az role assignment create --assignee-object-id {insert the id} --role "Reader" --scope {insert the dbsubnetResourceId}

# Add Users to the AD groups
## Create User for DBAdmins
az ad user create --display-name "TestUser1" --user-principal-name {insert name} --password {insert password} --force-change-password-next-login true

# Get the Users Object ID
az ad user show --id {___________.com} --query objectId -o tsv 

# Include it in the group
az ad group member add --group DBAdmins --member-id {userObjectId}

# Check the group membership(optional)
az ad group member check --group DBAdmins --member-id {userObjectId} --query value

# Check If Role is Assigned(Optional)
az role assignment list --assignee {_________.com} --query "[].{Role:roleDefinitionName, Scope:scope}" -o table

# Create User for WebAdmins Group
az ad user create --display-name "TestUser2" --user-principal-name {______-.com} --password {"insert password"}  --force-change-password-next-login true

#Get the User's ObectId
az ad user show --id {___.com} --query ObjectId -o tsv

# Include/Add it to the group
az ad group member add --group WebAdmins --member-id {UserobjectId}