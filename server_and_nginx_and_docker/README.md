
# Terraform and Ansible Integration Project

## Overview
This project demonstrates how to use Terraform to provision AWS infrastructure and Ansible to configure it. The infrastructure consists of an AWS EC2 instance, and the configuration includes setting up Nginx and Docker on the instance using Ansible playbooks.

## Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) installed on your local machine.
- AWS CLI configured with the appropriate credentials.
- An AWS key pair for SSH access to the EC2 instance.

## Project Structure
    Project/
    ├── Ansible/
    │   ├── docker-playbook.yml
    │   └── nginx-playbook.yml
    ├── main.tf
    ├── outputs.tf
    ├── providers.tf
    ├── var.tf     
    └── README.md


## Setup and Configuration

### Terraform Configuration

1. **`main.tf`**: Defines the AWS instance and includes local-exec provisioners to run Ansible playbooks.
2. **`var.tf`**: Contains variable definitions for AMI ID, instance type, key name, security group ID, volume size, instance name, and key path.
3. **`outputs.tf`**: Outputs the public IP of the provisioned EC2 instance.
4. **`providers.tf`**: Configures the AWS provider.

### Ansible Playbooks
1. **`nginx-playbook.yml`**: Installs and configures Nginx on the EC2 instance.
2. **`docker-playbook.yml`**: Installs and configures Docker on the EC2 instance.

## Setup Instructions

### Terraform

1. **Navigate to the Terraform directory:**

    ```sh
    cd project
    ```


2. **Initialize Terraform:**

    ```sh
    terraform init
    ```

3. **Apply the Terraform configuration:**

    ```sh
    terraform apply
    ```

   This command will:
   - Provision an EC2 instance.
   - Automatically run the Ansible playbooks (`nginx-playbook.yml` and `docker-playbook.yml`) to configure Nginx and Docker on the EC2 instance.

### Ansible Playbooks

The Ansible playbooks are executed automatically by Terraform as part of the provisioning process. There is no need to manually run them.

## Conclusion

This setup enables you to provision an EC2 instance on AWS using Terraform and automatically configure it with Nginx and Docker using Ansible playbooks. 

## References

- [Terraform Documentation](https://www.terraform.io/docs)
- [Ansible Documentation](https://docs.ansible.com/ansible/latest/index.html)


