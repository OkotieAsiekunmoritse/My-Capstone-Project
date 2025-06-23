#!/bin/bash

# Attach ReadOnlyAccess policy to DBAdmins

aws iam attach-group-policy --group-name DBAdmins --policy-arn arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess

