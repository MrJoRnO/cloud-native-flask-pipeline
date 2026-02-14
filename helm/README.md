Helm Chart - Flask Application Deployment
This directory contains the Helm Chart used to deploy the containerized Flask application onto the Amazon EKS cluster. Using Helm allows us to manage Kubernetes resources as a single unit and simplify environment-specific configurations.

Chart Structure

- Chart.yaml: Metadata about the chart (name, version, etc.).

- values.yaml: The central configuration file where image repository, replica count, and service types are defined.

- templates/deployment.yaml: Defines the desired state for our application pods.

- templates/service.yaml: Configures a LoadBalancer to expose the application to the internet.

- templates/_helpers.tpl: Reusable template snippets for naming consistency.

Prerequisites
1. Kubectl installed and configured to point to your EKS cluster:

- aws eks update-kubeconfig --region <REGION> --name <CLUSTER_NAME>

2. Helm CLI installed.

3. The Docker image must be present in the Amazon ECR repository.

Installation & Deployment

1. Navigate to the helm directory

2. Install the Chart:

- helm install my-flask-app ./flask-app

3. Verify the Deployment:
Check if the pods are running:

- kubectl get pods

like this:
NAME                           READY   STATUS    RESTARTS   AGE
my-flask-app-64f7dc7d4-c2chs   1/1     Running   0          5s
my-flask-app-64f7dc7d4-ln98s   1/1     Running   0          5s

4. Get the Application URL:
The service is configured as a LoadBalancer. Retrieve the public DNS address:

- kubectl get svc

Look for the EXTERNAL-IP field. It may take 2-3 minutes for the AWS Load Balancer to become fully active.

Upgrading the Application
If you push a new image or change the values.yaml, upgrade the release using:

- helm upgrade my-flask-app ./flask-app

Uninstallation
To remove the application and free up AWS resources (like the ELB):

- helm uninstall my-flask-app

