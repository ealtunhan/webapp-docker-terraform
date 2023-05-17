#Web-App with MySQL using Docker and Terraform on AWS Overview

This project aims to create a web-app with MySQL using Docker and Terraform on AWS. The web-app will be built using a stack of technologies, including Node.js, Express, and MySQL. Docker will be used to containerize the web-app and MySQL server. Terraform will be used to provision the necessary AWS infrastructure resources, including EC2 instances, security groups, and load balancers.

# Goals

The goal of this project is to learn how to deploy a web-app with MySQL using Docker and Terraform on AWS. By completing this project, I hope to:

- Gain hands-on experience with Docker and Terraform
- Learn how to deploy a web-app with a MySQL database
- Understand the basics of deploying infrastructure on AWS using Terraform
- Improve my overall understanding of DevOps practices

# Architecture

The architecture of the web-app will consist of the following components:

- Apache web server using the Express framework
- A MySQL database server
- A Docker container to package the web server and MySQL server
- An EC2 instance to host the Docker container
- An Application Load Balancer to distribute traffic to the EC2 instance
- A security group to control inbound and outbound traffic to the EC2 instance and MySQL server


# Steps

The following steps will be taken to deploy the web-app with MySQL using Docker and Terraform on AWS:

1. Set up an AWS account and configure AWS credentials on my local machine
2. Write a Terraform configuration file to provision the necessary infrastructure resources
3. Run terraform init to initialize the Terraform workspace
4. Run terraform plan to generate a plan for creating the infrastructure resources
5. Run terraform apply to create the infrastructure resources
6. Build a Docker image for the web server and MySQL server
7. Push the Docker image to a Docker registry
8. Run the Docker container on the EC2 instance
9. Test the web-app to ensure it is functioning as expected

# Conclusion

By completing this project, I hope to gain a better understanding of how to deploy a web-app with MySQL using Docker and Terraform on AWS. I will document my progress and share my experiences along the way.
