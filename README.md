# CI/CD Pipeline for my-app

## Overview

This repository contains a GitHub Actions CI/CD pipeline for building, pushing, and deploying my-app using AWS Elastic Container Registry (ECR) and ArgoCD on EKS. The pipeline automates the process of delivering updates efficiently and securely.

## Pipeline Workflow

### Build Stage

Triggered on every push to any branch, the build job performs the following tasks:

Checks out the repository.

Configures AWS credentials.

Logs in to Amazon ECR.

Builds a Docker image and tags it with a short commit SHA.

Pushes the built Docker image to AWS ECR.


### Deploy Stage

Triggered only when changes are pushed to the main branch, the deploy job:

Logs in to ArgoCD to manage Kubernetes applications.

Updates the Helm deployment parameters with the new Docker image tag.

Syncs the application with ArgoCD to deploy the updated image.


## Prerequisites

To use this pipeline, ensure the following:

An AWS access key & secret key with proper permissions to authenticate.

An ECR repository for storing container images.

A Kubernetes cluster with ArgoCD.

Helm-based deployment configured in ArgoCD.


## Environment Variables & Secrets


| Variable Name             | Type         | Description
| ----------------- | ---------------------|--------------------------------------------- |
| AWS_ACCESS_KEY |  Secret | AWS access key for authentication
| AWS_SECRET_KEY | Secret | AWS secret key for authentication
| AWS_REGION |  Env var | AWS region where the ECR repository hosted
| ECR_REPO_URL | Env var | ECR repository URL
| ARGOCD_SERVER |  Env var | Argocd server address
| ARGOCD_USERNAME | Env var | Argocd username for authentication 
| ARGOCD_PASSWORD | Secret | Argocd password for authentication


## Deployment

### Triggering the Pipeline

For feature branches: Push changes to any branch to trigger the build process.


For production releases: Merge changes into the main branch to trigger build and deployment process.



### Monitoring Deployment Status

Check GitHub Actions for pipeline execution details.

Verify the deployed application via ArgoCD.
