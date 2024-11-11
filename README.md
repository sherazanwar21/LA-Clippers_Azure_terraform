# Project Setup and Deployment

This project automates the deployment of a containerized Frontend and Backend application to Azure Kubernetes Service (AKS) using Terraform and Helm. This guide will walk you through the necessary steps to set up your infrastructure, build your containers, and deploy your application via CI/CD pipelines.

# Prerequisites

Before starting, ensure you have the following tools installed:

* Terraform (for provisioning Azure resources)
* Docker (for building containers)
* kubectl (for interacting with Kubernetes clusters)
* Helm (for managing Kubernetes packages)
* Azure CLI (for managing Azure resources)
* Git (for version control and pushing tags)

Also, make sure you have the necessary permissions to manage Azure resources and deploy to AKS.

1. Configure Your Variables

First, you need to configure the required variables before running the Terraform commands.

* Navigate to the terraform directory.
* Open the following files and add your own values:
* terraform/modules/aks_cluster/variables.tf: Add your AKS cluster configuration.
* terraform/modules/aks_cluster/main.tf: Configure the AKS cluster specifics.
* terraform/modules/acr/variables.tf: Add details for the Azure Container Registry (ACR).
* terraform/modules/nsg/variables.tf: Configure the Network Security Group settings.
* terraform/modules/resource_group/variables.tf: Define your Resource Group settings.
* Ensure that all necessary variables (e.g., subscription ID, resource group name, etc.) are filled correctly in the terraform.tfvars file.
* Example:
~~~Example in terraform/modules/aks_cluster/variables.tf
variable "aks_cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
  default     = "myakscluster"
}
~~~
2. Provision Infrastructure with Terraform

Once the values are configured, run the following commands to set up the infrastructure:

* Initialize Terraform (downloads necessary providers and sets up the backend): terraform init
* Apply the Terraform configuration (this will create the resource group, AKS cluster, ACR, and network security group): terraform apply
* Review the changes and type yes to approve.

3. Build and Push Docker Images

After the infrastructure is created, you will need to build and push the Docker images for your Frontend and Backend applications.

* Tag your repository:
~~~
git tag v1.0
git push origin v1.0
~~~
This will trigger the pipelines.

4. CI/CD Pipeline Execution

* Once the Git tag is pushed, the CI/CD pipeline will be triggered automatically. The pipeline is set up with two main GitHub Actions workflows:

4.1. docker-build.yaml
This pipeline will:

* Build the Frontend and Backend Docker images.
* Push the images to the Azure Container Registry (ACR).

4.2. k8-helm-deploy.yaml
,After docker-build.yaml completes, 
This pipeline will:

* Deploy the Frontend and Backend applications to the Azure Kubernetes Service (AKS) using Helm.
5. Verify Deployment

* Once the k8-helm-deploy.yaml workflow has completed successfully, you can verify that the application has been deployed correctly by checking the Kubernetes pods:
~~~
kubectl get pods
~~~
You should see your Frontend and Backend pods running.

6. Access Your Application

* If you have configured an Ingress Controller (e.g., Nginx Ingress), your application should be accessible via the specified domain or IP. You can check the external IP or domain name by running:
~~~
kubectl get ingress
~~~
This will give you the address at which your application is accessible.

# Troubleshooting

* If Terraform fails, ensure that your Azure credentials are correct and that you have sufficient permissions to create resources.
* If Docker build fails, check the Dockerfile and ensure that your application dependencies are set up correctly.
* If Helm deploy fails, check the Helm charts and the logs for the Kubernetes pods to identify any errors during deployment.
