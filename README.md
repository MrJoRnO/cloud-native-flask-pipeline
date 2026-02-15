🚀 Cloud-Native Flask Pipeline on AWS EKS

This project demonstrates a complete, automated DevOps lifecycle for a Flask application. It uses Infrastructure as Code (IaC) to provision AWS resources and a CI/CD Pipeline to automate testing, versioning, and deployment.

🏗️ Architecture Overview

- Infrastructure: Modular AWS setup using Terraform (VPC, EKS Cluster, ECR).

- Containerization: Flask app packaged with Docker.

- Orchestration: Managed Kubernetes via Amazon EKS.

- Deployment: Helm Charts for standardized Kubernetes resource management.

- Monitoring: Full observability stack with Prometheus & Grafana.

- Automation: GitHub Actions for full-stack CI/CD (GitOps).

📂 Project Structure
.
├── .github/workflows/   # CI/CD Pipeline (GitHub Actions)
├── app/                 # Flask Application & Dockerfile
├── helm/                # Kubernetes Helm Charts
├── terraform/           # IaC modules for AWS resources
└── README.md            # You are here!

🚀 The CI/CD Pipeline (GitOps)
Our pipeline is designed for a fully automated "Hands-Off" experience:

1. Infrastructure Sync: Automatically runs terraform apply if changes are detected in the terraform/ directory.

2. Semantic Versioning: Automatically calculates the next version (e.g., 1.0.0 -> 1.0.1) using Git tags.

3. Docker Lifecycle: Builds a new image only when needed and pushes it to Amazon ECR.

4. Blue/Green-style Update: Uses helm upgrade --install to deploy the new version to EKS without downtime.

🌟 Bonus Features Implemented

- Full Infrastructure Automation: Terraform runs directly within GitHub Actions.

- Smart Versioning: Version increments are controlled via commit messages (e.g., adding #minor to the commit message).

- Conditional Builds: The pipeline detects which files were changed to avoid redundant builds.

🛠️ Local Setup & Cluster Access
To manage the cluster and view metrics from your local terminal, follow these steps:

1. Configure AWS CLI:

- aws configure

2. Update Kubeconfig (Connect kubectl to EKS):

- aws eks update-kubeconfig --region eu-central-1 --name devops-assignment-eks

3. Verify Connection:

- kubectl get nodes

📖 How to Use

1. Setup AWS Secrets: Add AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY to GitHub Repository Secrets.

2. Infrastructure: Push changes to the terraform/ folder to trigger an environment update.

3. App Update: Push changes to the app/ folder.

- For a Patch (1.0.1): Regular commit.
- For a Minor (1.1.0): Add #minor to your commit message.

4. Access the App:
 Run ["kubectl get svc"] to get the LoadBalancer URL once the pipeline finishes.

📊 Monitoring & Observability

The project includes an automated deployment of the Prometheus & Grafana stack to the monitoring namespace.

Accessing Grafana Dashboards:
1. Establish a Tunnel:
```bash
 kubectl port-forward deployment/monitoring-grafana 3000:3000 -n monitoring
```

2. Access in Browser: Open http://localhost:3000.

3. Credentials:
**User**: admin 
**Password**: admin123

4. Visualization: Import Dashboard ID 15757 to see real-time CPU/RAM usage of your Flask Pods.
