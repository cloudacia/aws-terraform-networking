# An AWS VPC with a single EC2 instance with SSM console access

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
* 1 x public subnets
* 1 x Route table
* 1 x Internet Gateway
* 1 x EC2
* 1 x SSM Agent installed
* 1 x Security Groups


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
|-- vpc.tf                    # VPC, subnet and routing tables
|-- ec2.tf                    # Computing resources
|-- iam.tf                    # instance profiles, roles, IAM policies
|-- security.tf               # Security groups
|-- variables.tf              # Variables
|-- scripts                   # EC2 initialization scripts
|-- diagram.jpeg           # AWS network layout
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
