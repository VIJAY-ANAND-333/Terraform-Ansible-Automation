# Dynamic AWS EC2 Provisioning with Terraform and Ansible

Fully automated EC2 setup with EBS storage and a web server stack, integrated with Terraform and Ansible.

## Overview
- **Terraform**: Provisions an AWS EC2 instance with dynamic inputs (region, SSH key, instance name) and an EBS volume, then triggers Ansible automatically.
- **Ansible**: Configures Docker, Docker Compose, Nginx, and Certbot using an inventory file updated by Terraform.
- **Purpose**: End-to-end automation for rapid, scalable web server deployment.

## Tech Stack
- Terraform
- Ansible
- AWS (EC2, EBS)
- Docker, Docker Compose, Nginx, Certbot

## Features
- **Dynamic Inputs**: Customize region, key pair, and instance name at runtime.
- **EBS Storage**: Adds persistent volume to the EC2 instance.
- **Integrated Automation**: Terraform updates `hosts.ini` with the EC2 IP and runs Ansible—no manual steps.
- **Web-Ready**: Full stack for hosting apps with SSL support.

## Setup Instructions
1. **Prerequisites**:
   - Terraform and Ansible installed locally.
   - AWS CLI configured with credentials.
   - SSH key pair in AWS (e.g., `my-key.pem`).
2. **Run**:
   - Initialize: `terraform init`
   - Apply: `terraform apply` (prompts for region, key_name, instance_name)
3. **Verify**: SSH in (`ssh -i ~/.ssh/my-key.pem ubuntu@<public-ip>`):
   - `docker --version`
   - `nginx -v`
   - `certbot --version`

## Outcome
- Server setup from scratch to fully configured in one command.
- Streamlined automation reduces deployment time to minutes.

## Screenshots
![Server Setup](./server_setup.png)

---
Built by Vijay Anand M | [GitHub](https://github.com/VIJAY-ANAND-333) | [Email](mailto:vijayanandm333@gmail.com)
