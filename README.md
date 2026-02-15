Got it — your README is good, it just needs two fixes:

remove the “live services used” stuff that implies it’s running (NAT/ALB, etc. are fine to list, but add “deploy on demand”)

fix the How to Deploy section (it’s missing the correct folder + closing code block)

Also: the backslashes you pasted (\#, \##, \-\) might just be how it copied here, but make sure your actual README has normal Markdown (no leading \).

Here’s a cleaned, resume-ready README you can paste as-is:

# AWS Highly Available Web App (Terraform)

## Project Overview
This project provisions a highly available web application infrastructure on AWS using Terraform (Infrastructure as Code).

The application runs Nginx on EC2 instances in private subnets behind an internet-facing Application Load Balancer across multiple Availability Zones.

## Architecture
User → Internet → ALB (Public Subnets) → Target Group → Auto Scaling Group (Private Subnets) → EC2 (Nginx)

## AWS Services Used
- VPC (public & private subnets across 2 AZs)
- Internet Gateway + NAT Gateway
- Application Load Balancer (ALB)
- Auto Scaling Group (ASG)
- EC2 Launch Template
- Security Groups
- S3 (Terraform remote state)
- DynamoDB (Terraform state locking)

## Skills Demonstrated
- Infrastructure as Code (Terraform)
- High Availability Architecture
- AWS Networking (VPC, Subnets, Routing, NAT)
- Load Balancing & Auto Scaling
- Linux bootstrapping with user_data
- Git/GitHub workflow

## Deploy on Demand (No resources left running)
This project is designed to be deployed when needed and destroyed afterward to avoid AWS costs.

### Deploy
```bash
cd terraform/envs/dev
terraform init
terraform apply

