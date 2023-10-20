terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  #cloud {
  #  organization = "CFelteau"
  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}
}

provider "terratowns" {
  endpoint = "https://terratowns.cloud/api"
  user_uuid = var.user_uuid
  token = var.terratowns_token
}

/*
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  assets_path = var.assets_path
  content_version = var.content_version
}
*/

resource "terratowns_home" "home" {
  name = "How to play Arcanum in 2023!"
  description = <<DESCRIPTION
  Arcanum is a game from 2001 that shipped with a lot of bugs. 
  Modders have removed all the originals making this game really to play (despite that old looking graphics). 
  This is my guide that will show you how to play Arcanum without spoiling the plot."
  DESCRIPTION
  #domain_name = module.terrahouse_aws.cloudfront_url
  domain_name = "3fjg4fj.cloudfront.net"
  town = "gamers-grotto"
  content_version = 1
}