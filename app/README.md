# Flask Application & Dockerization

This folder contains a simple Flask web application and the configuration required to package it as a Docker container for deployment on Amazon EKS.

## Prerequisites
- Docker installed locally.
- AWS CLI configured with permissions to access ECR.
- An existing ECR repository (created via the Terraform module).

## Files in this Directory
- `app.py`: The Python Flask application.
- `requirements.txt`: Python dependencies.
- `Dockerfile`: Instructions for building the Docker image.

## Build and Push Process

To containerize the application and push it to Amazon ECR, follow these steps:

### 1. Authenticate Docker to ECR
Replace `<AWS_ACCOUNT_ID>` and `<REGION>` with your specific details:
```bash
aws ecr get-login-password --region <REGION> | docker login --username AWS --password-stdin <AWS_ACCOUNT_ID>.dkr.ecr.<REGION>.amazonaws.com

2. Build the Docker Image

- docker build -t flask-app .

3. Tag the Image

- docker tag flask-app:latest <ECR_REPOSITORY_URL>:latest

Running Locally (Optional)
To test the application before pushing:

docker run -p 5000:5000 flask-app

The app will be accessible at http://localhost:5000.

