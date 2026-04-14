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


# AWS Highly Available Web Application (Terraform)

## Overview

This project provisions a highly available web application in AWS using Terraform. It deploys infrastructure across multiple Availability Zones and serves traffic through an Application Load Balancer (ALB) to EC2 instances running Nginx.

The goal of this project is to demonstrate core cloud engineering concepts including networking, load balancing, auto scaling, and Infrastructure as Code (IaC).

---

## Architecture

Traffic flow:

Internet → Application Load Balancer → Target Group → Auto Scaling Group → EC2 Instances (Private Subnets)

### Key Design Decisions
- ALB is deployed in public subnets to receive internet traffic
- EC2 instances are deployed in private subnets for security
- NAT Gateway allows instances to install packages (Nginx) during boot
- Auto Scaling Group maintains high availability across multiple Availability Zones

---

## AWS Services Used

- VPC (custom)
- Public & Private Subnets (multi-AZ)
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- Application Load Balancer (ALB)
- Target Group
- Launch Template
- Auto Scaling Group (ASG)
- EC2 (Amazon Linux 2023)
- S3 (Terraform remote state)
- DynamoDB (state locking)

---

## Project Structure

```
terraform/
└── envs/
    └── dev/
        ├── provider.tf
        ├── network.tf
        ├── security_groups.tf
        ├── alb.tf
        ├── launch_template.tf
        ├── asg.tf
        ├── outputs.tf
        └── variables.tf
```

---

## Deployment Steps

### 1. Navigate to environment
```bash
cd terraform/envs/dev
```

### 2. Initialize Terraform
```bash
terraform init
```

### 3. Preview changes
```bash
terraform plan
```

### 4. Deploy infrastructure
```bash
terraform apply
```

### 5. Destroy (to avoid costs)
```bash
terraform destroy
```

---

##  Access the Application

After deployment, Terraform outputs:

```bash
terraform output alb_url
```

Example:
```
http://your-alb-url
```

Refresh the page multiple times to see traffic distributed across instances.

---

## Features

- Highly available architecture across multiple AZs
- Load balanced traffic using ALB
- Auto Scaling Group maintains desired capacity
- EC2 instances in private subnets (secure design)
- Automated Nginx setup via user_data
- Infrastructure fully managed with Terraform

---

## What I Learned

- Designing secure AWS architectures using public/private subnet separation
- How ALB routes traffic to target groups
- How Auto Scaling Groups manage EC2 lifecycle
- How to use Terraform to provision and manage infrastructure
- Troubleshooting real-world issues (health checks, drift, networking, state)

---

## Future Improvements

- Add HTTPS using ACM and ALB listener (port 443)
- Add custom domain with Route 53
- Add CloudWatch monitoring and alarms
- Implement CI/CD pipeline (CodePipeline or GitHub Actions)
- Containerize the application (ECS or Kubernetes)

---

## Author

Jordan Wray