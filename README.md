# IAM Roles and Secure Access Automation Project

---

## Breakdown of Tasks Successfully Completed for Project

### Create AWS Infrastructure

- Created a **VPC**
  
-<img width="694" alt="vpc created via bash script" src="https://github.com/user-attachments/assets/7033e69c-4c83-4bc4-b943-f5372f06c897" />

<img width="957" alt="vpc" src="https://github.com/user-attachments/assets/f1cfe4c1-c5ec-4ddb-bc3b-f00eae642e33" />

- Created two subnets: `WebSubnet` and `DBSubnet`.
  
 <img width="301" alt="Web Subnet Created via bash script showing tags and ID 1" src="https://github.com/user-attachments/assets/cba86dbe-e9a0-455d-af97-1aa331d3e7cf" />

<img width="596" alt="DB Subnet created with tag and ID via bashscript" src="https://github.com/user-attachments/assets/885e6541-26b7-48d2-affc-40c9e3611141" />

 <img width="956" alt="subnets" src="https://github.com/user-attachments/assets/7253b2d3-9aa8-4635-8fbd-48e736afe8ab" />


### Create Two IAM Groups
- Created IAM groups: `WebAdmins` and `DBAdmins`.

<img width="462" alt="IAM Groups created via bashscript" src="https://github.com/user-attachments/assets/f13e2507-e358-402c-87fd-dd75bced900d" />

<img width="959" alt="IAM groups created" src="https://github.com/user-attachments/assets/87059672-1dca-4f98-81ff-b205b471ee68" />


### Assign Roles to DBAdmins
- Attached **read-only policies** to `DBAdmins` for subnet resources.



### Add Test Users
- Created test users: `Tom`, `Jerry`, `Joseph`, and `Mary`.
  
<img width="632" alt="Create test users for IAM Groups via bashscript" src="https://github.com/user-attachments/assets/d0a54d8d-9017-48e9-ab41-6bcc76c5c542" />

<img width="959" alt="Users created" src="https://github.com/user-attachments/assets/8aa3ad25-299e-4883-9b54-c14391721a01" />


- Added `Tom` and `Jerry` to `WebAdmins`.
- Added `Joseph` and `Mary` to `DBAdmins`.
  
<img width="400" alt="Add users to IAM Groups via bash script" src="https://github.com/user-attachments/assets/35e16c0c-03f1-4636-b79d-fb84ad4bbc0b" />




---

##  CI/CD Pipeline – GitHub Actions

This project uses **GitHub Actions** to automatically deploy the infrastructure.

- **Runs the following scripts:**
  - `scripts/create_vpc_and_subnets.sh`
  - `scripts/create_iam_groups.sh`
  - `scripts/assign_policies.sh`
  - `scripts/add_users_to_groups.sh`

---

## Cleanup Script

To remove all resources, run:

```bash
bash scripts/cleanup.sh
