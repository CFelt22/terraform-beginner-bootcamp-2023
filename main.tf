terraform {
  cloud {
    organization = "CFelteau"
    workspaces {
      name = "terra-house-1"
    }
  }
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "random" {
  # Configuration options
}

provider "aws" {
  region     = ""
  access_key = ""
  secret_key = ""
}

resource "random_string" "bucket_name" {
  length           = 32
  special          = false
  lower            = true
  upper            = false
}
# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string

resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result
}
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
# https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html

output "random_bucket_name" {
  value = random_string.bucket_name.result
}