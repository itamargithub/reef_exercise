# 📄 README.md

# Hello World - DevOps Assignment

## Overview

This project deploys a simple "Hello World" web application on AWS using:

- Terraform (Infrastructure as Code)
- Docker (Containerization)
- GitHub Actions (CI/CD pipeline)
- AWS ECS (Elastic Container Service with Fargate)
- Application Load Balancer (ALB) with HTTPS

Everything is triggered **automatically** on every push to the main branch!

---

## Prerequisites

Before starting, ensure you have:

- An AWS Account (free tier is enough)
- A domain name (optional — only needed if you want to validate ACM certificates via DNS)
- [GitHub](https://github.com/) account
- Basic familiarity with Git (clone, push)

---

## AWS Setup

### 1. Create an IAM User for GitHub Actions

- Go to AWS Console → IAM → Users → Add user
- Name: github-actions
- Access Type: **Programmatic Access** ✅
- Attach existing policies directly:
  - AmazonEC2FullAccess
  - AmazonECS_FullAccess
  - ElasticLoadBalancingFullAccess
  - AmazonVPCFullAccess
  - AmazonECRFullAccess
  - ACMFullAccess
  - (optional for Route53: AmazonRoute53FullAccess)
- Save the **Access Key ID** and **Secret Access Key** securely.

---

### 2. Set AWS Credentials in GitHub Repository Secrets

- Go to your GitHub Repository → Settings → Secrets → Actions
- Create two new secrets:
  - AWS_ACCESS_KEY_ID
  - AWS_SECRET_ACCESS_KEY

---

## Deployment Steps

### 1. Fork this repository

Fork this project to your GitHub account.

---

### 2. Clone your repository

Clone your fork locally:

bash
git clone [https://github.com/<your-username>/<repo-name>.git](https://github.com/itamargithub/reef_exercise)
cd <repo-name>


---

### 3. Modify Domain Name (Optional)

If you own a domain, edit the terraform/acm.tf file:

hcl
domain_name = "*.yourdomain.com"


If you do not own a domain:

* Request a public ACM certificate.
* You will need to manually validate the certificate via DNS or email.

---

### 4. Push to Main Branch

When you push to the main branch:

* GitHub Actions will:

  * Build the Docker image
  * Push the image to AWS ECR
  * Apply Terraform scripts
  * Provision AWS infrastructure automatically

✅ You do **NOT** need to run any Terraform commands manually!

---

## How It Works

| Step                  | Description                                |
| --------------------- | ------------------------------------------ |
| Push to main branch   | GitHub Actions trigger CI/CD pipeline      |
| Build Docker image    | Docker image is built using Dockerfile     |
| Push Docker image     | Docker image is pushed to AWS ECR          |
| Terraform Init/Apply  | Infrastructure is provisioned              |
| Deploy Service        | ECS Fargate service is updated             |
| HTTPS Access          | App is served via Load Balancer with HTTPS |

---

## Access Your Application

Once deployment finishes:

1. Go to your GitHub Actions → Select the latest Workflow run.
2. Find the **Terraform Output** — it will display the Load Balancer DNS name.
3. Access your application:

bash
https://<your-load-balancer-dns>


You should see:


Hello World


displayed in your browser!

---

## Troubleshooting

| Problem                                    | Solution                                                               |
| ------------------------------------------ | ---------------------------------------------------------------------- |
| ACM Certificate not validated              | Go to AWS ACM console and manually complete DNS validation             |
| Load Balancer is not accessible            | Check ALB security group allows inbound TCP 443 traffic from 0.0.0.0/0 |
| ECS service is failing                     | Check ECS task logs for container issues                               |
| GitHub Actions fails during terraform init | Ensure AWS credentials in GitHub secrets are correct                   |
| Docker image not pulling                   | Check ECR repository for authentication errors                         |

---

## Clean-Up

After testing, **destroy** all resources to avoid AWS charges:

bash
cd terraform
terraform destroy -auto-approve


Alternatively, manually delete the resources in the AWS Console:

* ECS Service
* ALB
* Target Groups
* ECR Repository
* VPC
* IAM Roles

---

## Author

Created as part of the **REEF DevOps Home Assignment**.

---
