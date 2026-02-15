\# AWS Highly Available Web App (Terraform)



\## Project Overview

This project provisions a highly available web application infrastructure on AWS using Terraform Infrastructure as Code.



The application runs Nginx on EC2 instances in private subnets behind an Application Load Balancer across multiple Availability Zones.



\## Architecture

User → Internet → ALB → Auto Scaling Group → EC2 → Nginx



\## AWS Services Used

\- VPC (public \& private subnets)

\- Internet Gateway + NAT Gateway

\- Application Load Balancer

\- Auto Scaling Group

\- EC2 Launch Templates

\- Security Groups

\- S3 (Terraform remote state)

\- DynamoDB (Terraform state locking)



\## Skills Demonstrated

\- Infrastructure as Code (Terraform)

\- High Availability Architecture

\- AWS Networking (VPC, Subnets, Routing)

\- Load Balancing \& Auto Scaling

\- Linux bootstrapping with user\_data

\- DevOps workflow \& Git version control



\## How to Deploy

```bash

terraform init

terraform apply

