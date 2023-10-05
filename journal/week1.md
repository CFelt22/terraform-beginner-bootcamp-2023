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
- [References](#references)


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
We can use the `-var-file`to specify a variable file. It is more convenient to set a lot of variable eg. `terraform -var-file="my_vars.tfvars"`

### terraform.tfvars
This is the default file to load in Terraform variables in bulk.

### auto.tfvars
If we want to use custom name files for the variables instead of `terraform.tfvars`, we can add *.auto* and the file is automatically loaded as a variable file. eg. `my_custom_file.auto.tfvars` This is very usefull when we are dealing with child modules.

### order of terraform variables
The Terraform variables methods are used in this order[^1] :
1. Any `-var` and `-var-files`options on the command line, in the order they are provided.
2. Any `*.auto.tfvars`or `*.auto.tfvars.json`files, processed in lexical order of their filenames.
3. `terraform.tfvars.json`
4. `terraform.tfvars`
5. Environment variables

## Dealing with Configuration Drift

### What happens if we lose our state file?
If you lose your statefile, you most likely have to tear down all your cloud infrastructure manually. You can use terraform port but it won't for all cloud resources. You need to check the terraform provides documentation for which resources support import.

### Fix Missing Resources with Terraform Import

`terraform import aws_s3_bucket.bucket bucket-name`

[Terraform Import AWS S3 Bucket Import](https://developer.hashicorp.com/terraform/cli/import)

### Fix Manual Configuration
If someone goes and delete or modifies cloud resource manually through ClickOps. If we run Terraform plan with attempt to put our infrastructure back into the expected state fixing Configuration Drift.

## Fix using Terraform Refresh

```sh
terraform apply -refresh-only -auto-approve
```

## Terraform Modules

It is recommended to place modules in a `module`directory when locally developping modules but you can name it whatever you like.

### Passing Input Variables

We can pass input variables to out module.
The module has to declare the terraform variables in its own variables.tf
```tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}
```

### Modules Sources

Using the source we can import the module from various places eg:
- locally
- Github
- Terraform Registry

```tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
}
```

[Modules Sources](https://developer.hashicorp.com/terraform/language/modules)

## References
[^1]: https://spacelift.io/blog/terraform-tfvars
