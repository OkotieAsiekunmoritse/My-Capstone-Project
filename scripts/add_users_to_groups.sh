#!/bin/bash

# Create 4 new Test users for the IAM Groups
aws iam create-user --user-name Tom
aws iam create-user --user-name Jerry
aws iam create-user --user-name Joseph
aws iam create-user --user-name Mary


# Create new Users Tom and Jerry to WebAdmins, Joseph and Mary to DBAdmins
aws iam add-user-to-group --user-name Tom --group-name WebAdmins
aws iam add-user-to-group --user-name Jerry --group-name WebAdmins
aws iam add-user-to-group --user-name Joseph --group-name DBAdmins
aws iam add-user-to-group --user-name Mary --group-name DBAdmins

echo "Successfully assigned"