# AWS Network Firewall Lab /#1

**Built with**

Terraform manages the deployment.

**Requirements**

1. AWS account
2. IAM user with admin privileges
3. Access and secret keys
4. AWS CLI
5. Terraform installed

**AWS resources created**

* 1 x VPC
* 1 x firewall subnets
* 1 x private subnets
* 3 x Route table
* 1 x Internet Gateway
* 1 x EC2
* 2 x SSM Agent installed
* 3 x Security Groups
* 4 x VPC endpoint
* 1 x IAM roles
* 1 x IAM profiles
* 1 x Network Firewall
* 1 x Network Firewall Policy
* 1 x Network Firewall Rule Group

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
|-- network-firewall.tf       # Network firewall configuration
|-- vpc.tf                    # VPC, subnet and routing tables
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

**Testing AWS Firewall**

All traffic from the VPC to the Internet is blocked, except HTTP traffic to the following domains: ["www.cloudacia.com", "www.google.com", "github.com"].

For testing the Network Firewall rules use the following command from the EC2 instance:

$ curl -Is http://www.cloudacia.com | head -n

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
