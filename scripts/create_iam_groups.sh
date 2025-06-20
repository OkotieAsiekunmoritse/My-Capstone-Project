#!/bin/bash


# Create Two IAM groups named WebAdmins and DBAdmins
aws iam create-group --group-name WebAdmins
aws iam create-group --group-name DBAdmins

