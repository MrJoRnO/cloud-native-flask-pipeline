Infrastructure as Code - AWS EKS Environment
This folder contains the Terraform configuration to deploy a production-ready, modular environment on AWS, including networking, container registry, and a managed Kubernetes cluster.

Architecture Components
- VPC Module: Creates a custom VPC with Public and Private subnets across multiple AZs, NAT Gateway for private egress, and Internet Gateway.

- ECR Module: Sets up an Amazon Elastic Container Registry for storing Docker images.

- EKS Module: Deploys an Amazon EKS Cluster with a managed Node Group using a custom Launch Template to ensure stability and cost-awareness.

- S3 Backend: State is stored remotely in an S3 bucket with versioning enabled for safety.

Prerequisites
1. AWS CLI configured with appropriate permissions.

2. Terraform CLI (v1.0.0+) installed.

3. An existing S3 Bucket for the backend state (as specified in backend.tf).

How to Deploy
1. Initialize Terraform:
    Download providers and initialize the remote backend.

- terraform init

2. Plan the Deployment:
    Review the resources that will be created.

- terraform plan

3. Apply the Configuration:
    Deploy the infrastructure to AWS.

- terraform apply

Note: Deployment takes approximately 15-20 minutes.

Outputs
Upon successful completion, Terraform will provide:
1. eks_cluster_name: The name required for kubectl configuration.

2. ecr_repository_url: The endpoint for pushing Docker images.

3. eks_cluster_endpoint: The Kubernetes API server URL.

Cost Awareness & Cleanup
To avoid unnecessary charges, the environment uses t3.medium instances (or c7i-flex.large where eligible). Always destroy the environment when finished:

- terraform destroy