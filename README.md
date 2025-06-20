# IAM Roles and Secure Access Automation Project

---

## Breakdown of Tasks Successfully Completed for Project

### Create AWS Infrastructure
- Created a **VPC**
-<img width="694" alt="vpc created via bash script" src="https://github.com/user-attachments/assets/7033e69c-4c83-4bc4-b943-f5372f06c897" />
- <img width="957" alt="vpc" src="https://github.com/user-attachments/assets/f1cfe4c1-c5ec-4ddb-bc3b-f00eae642e33" />

- Created two subnets: `WebSubnet` and `DBSubnet`.
### Create Two IAM Groups
- Created IAM groups: `WebAdmins` and `DBAdmins`.

### Assign Roles to DBAdmins
- Attached **read-only policies** to `DBAdmins` for subnet resources.

### Add Test Users
- Created test users: `Tom`, `Jerry`, `Joseph`, and `Mary`.
- Added `Tom` and `Jerry` to `WebAdmins`.
- Added `Joseph` and `Mary` to `DBAdmins`.

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
