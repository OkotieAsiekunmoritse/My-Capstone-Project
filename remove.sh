#!/bin/bash

# Remove AD Groups 
GROUPS=("WebAdmins" "DBAdmins")

# User emails created
USERS= ("_______" "_______" "_______" "________")

echo "Removing users from groups..."
for group in "${GROUPS[@]}"; do
for user in "${USERS[@]}"; do
echo "Removing $user from $group..."
az ad group member remove --group "$group" --member-id "$user"

 done
done

echo "Deleting users..."
for user in "${USERS[@]}; do

az ad user delete --id "$user"
echo "Deleted $user" 
done


 