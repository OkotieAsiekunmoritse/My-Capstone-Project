# IAM Roles and Secure Access Automation Project

---

## Breakdown of Tasks Successfully Completed for Project

To automate the setup of secure access controls using Bash scripting. 
This included creating a secure network configuration and implementing IAM role-based access to different segments of the infrastructure. 


### 1. Create AWS Infrastructure

- Create a **VPC**

I created a VPC with a defined CIDR block, which serves as the foundational layer for the network infrastructure. It is necessary because it provides full control over networking and security configurations.

<img width="285" alt="vpc creation" src="https://github.com/user-attachments/assets/c0f2ebaf-1259-471a-ab18-0ba424eecf52" />


<img width="957" alt="vpc" src="https://github.com/user-attachments/assets/f1cfe4c1-c5ec-4ddb-bc3b-f00eae642e33" />

---

- Created two subnets: `WebSubnet` and `DBSubnet`.

 Created two subnets as they help segment the VPC for better security and access control. 
 Web Subnet is the  Public subnet for web servers that may need internet access.
 DB Subnet is the Private subnet for databases to restrict external access.
  
 <img width="301" alt="Web Subnet Created via bash script showing tags and ID 1" src="https://github.com/user-attachments/assets/cba86dbe-e9a0-455d-af97-1aa331d3e7cf" />

<img width="596" alt="DB Subnet created with tag and ID via bashscript" src="https://github.com/user-attachments/assets/885e6541-26b7-48d2-affc-40c9e3611141" />

 <img width="956" alt="subnets" src="https://github.com/user-attachments/assets/7253b2d3-9aa8-4635-8fbd-48e736afe8ab" />


---


### 2. Create Two IAM Groups

- Created IAM groups: `WebAdmins` and `DBAdmins`.

<img width="462" alt="IAM Groups created via bashscript" src="https://github.com/user-attachments/assets/f13e2507-e358-402c-87fd-dd75bced900d" />

<img width="959" alt="IAM groups created" src="https://github.com/user-attachments/assets/87059672-1dca-4f98-81ff-b205b471ee68" />

**WebAdmins Group**:

The users in this group manage resources in the Web subnet.

The users are assigned IAM policies granting them access to EC2 rights to web servers.

**DBAdmins Group**:

The users in this group are responsible for maintaining the organizations database. 

The users ensure databases are secure, available, backedup and working effectively.


---

### 3.  Assign Roles to DBAdmins

- I attached **read-only policies** i.e. AmazonEC2ReadOnlyAccess to `DBAdmins` for subnet resources. Thereby causing its users to be limited to read-only access on DB subnet resources.

<img width="668" alt="Attach ReadOnlyAccess policy to DBAdmins via bashscript" src="https://github.com/user-attachments/assets/003f5d31-2403-402c-87c7-a32e26aa8374" />


<img width="957" alt="DBAdmins displaying its permission policy" src="https://github.com/user-attachments/assets/d4f17ab0-c32a-4a97-8f07-56839bbafe3f" />

---


### 4.  Create Test Users and Add to IAM Groups

- Created test users: `Tom`, `Jerry`, `Joseph`, and `Mary` and added them to the respective groups earlier created.
- Although the users in WebAdmins group have full access to Web subnet EC2s, those in  DBAdmins group have only read-only access to DB subnet resources.
  
<img width="632" alt="Create test users for IAM Groups via bashscript" src="https://github.com/user-attachments/assets/d0a54d8d-9017-48e9-ab41-6bcc76c5c542" />

<img width="959" alt="Users created" src="https://github.com/user-attachments/assets/8aa3ad25-299e-4883-9b54-c14391721a01" />


- Added `Tom` and `Jerry` to `WebAdmins`.
  
- Added `Joseph` and `Mary` to `DBAdmins`.
  
<img width="400" alt="Add users to IAM Groups via bash script" src="https://github.com/user-attachments/assets/35e16c0c-03f1-4636-b79d-fb84ad4bbc0b" />

<img width="953" alt="DBAdmins displaying its users" src="https://github.com/user-attachments/assets/14cbfcd0-ea54-4309-ac4b-f2b4982a594c" />


---

##  5. CI/CD Pipeline – Using GitHub Actions


This project uses **GitHub Actions** to automatically deploy the infrastructure.

Using CI/CD Integration, I set up a basic pipeline using that:

- Triggers on push.

- Runs the provisioning scripts:
  
  - `bash scripts/create_vpc_and_subnets.sh`
  - `bash scripts/create_iam_groups.sh`
  - `bash scripts/assign_policies.sh`
  - `bash scripts/add_users_to_groups.sh`

- Executes clean_up for deletion.
    

<img width="958" alt="Deployment of yml file 1a" src="https://github.com/user-attachments/assets/d3709e25-077d-43f3-9ee4-e1ec627df21d" />

<img width="952" alt="Deployment of yml file a" src="https://github.com/user-attachments/assets/8ca59c6a-4b65-4843-8ea4-527f51119fea" />

<img width="956" alt="FinalDeploymentlog" src="https://github.com/user-attachments/assets/99d67f03-3252-4777-b8ef-c66e3f17173a" />



---

## Clean_up Script

I created a Bash script that revokes roles, removes users from groups, and deletes all resources. By using

run:

 - bash scripts/clean_up.sh
