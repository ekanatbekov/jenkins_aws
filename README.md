# On-Demand Jenkins Infrastructure with Terraform (AWS)

##  Overview

This project demonstrates how to provision **Jenkins on-demand using Terraform** in AWS to optimize cost and automate CI/CD infrastructure.

Instead of running Jenkins 24/7, this setup allows you to:

- Spin up Jenkins only when needed  
- Destroy it when not in use  
- Reduce infrastructure costs  
- Access securely via AWS SSM (no SSH required)  

---

##  Architecture

**Components:**
- Terraform (Infrastructure as Code)
- AWS EC2 (Ubuntu)
- Jenkins (CI/CD tool)
- AWS IAM (roles & permissions)
- AWS SSM (secure access without SSH)
- Security Groups (controlled access to port 8080)

---

##  Features

- Fully automated EC2 provisioning using Terraform  
- Jenkins installation via `user_data` (cloud-init)  
- IAM role with SSM access (no SSH keys required)  
- Public access to Jenkins UI via port 8080  
- Reproducible infrastructure (destroy & recreate anytime)  

---

##  Project Structure


.
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
├── templates/
│ └── user_data.sh.tftpl
├── generator.sh
├── jenkins.sh
└── README.md


---

##  Prerequisites

### 1. AWS Account
Create an IAM user with programmatic access.

### 2. Required Policy (for demo)

Attach:
- `AdministratorAccess` (for simplicity)

>  For production use, follow the **least-privilege principle**

---

##  Install Tools

- Terraform  
- AWS CLI  

## How to Use
1. Create your tfvars file
cp terraform.tfvars.example terraform.tfvars

Update:

allowed_cidr_blocks = ["YOUR_PUBLIC_IP/32"]
2. Run the helper script
chmod +x generator.sh
./generator.sh

Choose:

1 → Create Jenkins

2 → Destroy Jenkins

 Access Jenkins

After deployment, Terraform outputs:

Jenkins URL

Public IP

SSM connection command

Open Jenkins:

http://<public-dns>:8080
 Get Initial Admin Password
aws ssm start-session --target <instance-id> --region us-east-1
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

## Notes

This project uses the default VPC to keep things simple for a demo/lab setup.

Possible Improvements

Custom VPC and subnets

ALB + HTTPS

Private networking with SSM-only access