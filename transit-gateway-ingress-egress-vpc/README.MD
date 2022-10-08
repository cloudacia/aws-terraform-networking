# Transit Gateway with Egress and Ingress VPC

**Built with**

Terraform manages the deployment.

**Requirements**

1. AWS account
2. IAM user with admin privileges
3. Access and secret keys
4. AWS CLI
5. Terraform installed

**AWS resources created**

* 4 x VPC
* 1 x VPC Transit Gateway
* 4 x VPC attachments
* 4 x public subnets
* 6 x private subnets
* 6 x Route table
* 2 x Internet Gateway
* 2 NAT Gateway
* 4 x EC2
* 2 x SSM Agent installed
* 6 x Security Groups
* 8 x VPC endpoint
* 1 x IAM roles
* 1 x IAM profiles
* 1 x SSH key
* 2 x EIP
* 1 x ALB

**Getting started**

Deploy the code in your AWS account with Terraform

`terraform init`

`terraform validate`

`terraform plan`

`terraform apply`

`terraform destroy`


**Folder structure options and naming conventions for software projects**
```
.
|-- main.tf                   # AWS provider's configuration
|-- vpc_a.tf                  # VPC, subnet and routing tables
|-- vpc_b.tf                  # VPC, subnet and routing tables
|-- egress_vpc.tf.tf          # VPC, subnet and routing tables
|-- transit_gateway.tf        # TG, TG attachments, tables, and routes
|-- ec2.tf                    # Computing resources
|-- iam.tf                    # instance profiles, roles, IAM policies
|-- security_groups.tf        # Security groups
|-- ssh_keys.tf               # SSH keys
|-- variables.tf              # Variables
|-- scripts                   # EC2 initialization scripts
|-- diagram.jpeg              # AWS network layout
|-- LICENSE.txt
|-- README.md
```

**Architecture**

![Screenshot](diagram.jpeg)

**Contributing**

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are greatly appreciated.

If you have a suggestion to improve this, please fork the repo and create a pull request. You can also open an issue with the tag "enhancement".

Don't forget to give the project a star! Thanks again!

**License**

It is distributed under the MIT License. See LICENSE.txt for more information.

**Contact**

Name: Eugenio Duarte

Email: eduarte@cloudacia.com
