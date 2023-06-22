# Terraform-AWS-RDS-Provisioning-Project
This repository contains Terraform code for automating the provisioning of an Amazon RDS (Relational Database Service) instance on the AWS cloud platform.

**Overview**

The purpose of this project is to provide a robust and scalable infrastructure solution for provisioning an RDS instance using Terraform. By automating the creation process, it simplifies the deployment of managed databases on AWS, enabling efficient management of data-driven applications.

**Prerequisites**

Before using this project, ensure that you have the following prerequisites:

- Terraform installed on your local machine.
- Valid AWS credentials with sufficient permissions to create and manage RDS instances.
  
**Usage**

Follow the steps below to provision the RDS instance:

1. Clone the repository:
git clone https://github.com/Samuel-Lalditsak/terraform-aws-rds-provisioning-project.git
cd terraform-aws-rds-provisioning

2. Customize variables:
Review the 'variables.tf' file to explore the available configuration options. Modify the default values in the 'terraform.tfvars' file or create your own file to provide customized values.

3. Initialize Terraform:
Run the following command to initialize the project:
terraform init

4. Provision the infrastructure:
Preview the changes by running:
terraform plan

  If everything appears as expected, create the infrastructure by running:
  terraform apply

  Confirm the changes by entering 'yes' when prompted.

5. Access the RDS instance:

Once the provisioning process completes, the output will display critical information such as the RDS instance endpoint, username, and password. Utilize this information to establish connections to the RDS instance from your applications.

**Clean Up**

To tear down the infrastructure and remove the RDS instance, run:

terraform destroy

Confirm the deletion by entering 'yes' when prompted.

Note: Exercise caution while running the terraform destroy command, as it permanently deletes the RDS instance and its associated resources.

**Contributions**

Contributions to this project are welcomed. Please feel free to submit bug reports, feature requests, or pull requests.

**License**

This project is licensed under the MIT License.

**Acknowledgments**

Terraform - Infrastructure as Code tool provided by HashiCorp.
AWS - Amazon Web Services, the cloud computing platform used for provisioning the RDS instance.
