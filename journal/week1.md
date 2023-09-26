# Terraform Beginner Bootcamp 2023 - Week 1
## Table of Contents

- [Root Module Structure](#root-module-structure)
- [Terraform and Input Variables](#terraform-and-input-variables)
    * [Terraform Cloud Variables](#terraform-cloud-variables)
    * [Loading Terraform Input Variables](#loading-terraform-input-variables)
    * [var flag](#var-flag)
    * [var-file flag](#var-file-flag)
    * [terraform.tfvars](#terraformtfvars)
    * [auto.tfvars](#autotfvars)
    * [order of terraform variables](#order-of-terraform-variables)


## Root Module Structure

Our root module structure is as follow:
 
```
PROJECT_ROOT
│
├── main.tf                 # everything else.
├── variables.tf            # stores the structure of input variables
├── terraform.tfvars        # the data of variables we want to load into our terraform project
├── providers.tf            # defines required providers and their configuration
├── outputs.tf              # stores our outputs
└── README.md               # required for root modules
```

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Terraform and Input Variables

### Terraform Cloud Variables
In Terraform we can set two kind of variables:
- Environment Variables : those you would set in your bash terminal eg. AWS credentials.
- Terraform Variables : those that you would normally set in your tfvars file.
We can set Terraform Cloud variables to be sensitive so they are not shown visibly in the UI.

### Loading Terraform Input Variables
https://developer.hashicorp.com/terraform/language/values/variables

### var flag
We can use the `-var` flag to set an input variable or override a variable in the tfvars file eg. `terraform -var user_id="my-user-id"`

### var-file flag

### terraform.tfvars
This is the default file to load in Terraform variables in bulk.

### auto.tfvars

### order of terraform variables