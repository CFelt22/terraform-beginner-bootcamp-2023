terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  cloud {
    organization = "CFelteau"
    workspaces {
      name = "terra-house-1"
    }
  }
}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}


module "home_arcanum_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.arcanum.public_path
  content_version = var.arcanum.content_version
}


resource "terratowns_home" "home_arcanum" {
  name = "How to play Arcanum in 2023!"
  description = <<DESCRIPTION
  Arcanum is a game from 2001 that shipped with a lot of bugs. 
  Modders have removed all the originals making this game really to play (despite that old looking graphics). 
  This is my guide that will show you how to play Arcanum without spoiling the plot."
  DESCRIPTION
  domain_name = module.home_arcanum_hosting.domain_name
  #domain_name = "j7jd73h.cloudfront.net"
  town = "missingo"
  content_version = var.arcanum.content_version
}

module "home_pumpkin_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.pumpkin.public_path
  content_version = var.pumpkin.content_version
}

resource "terratowns_home" "home_pumpkin" {
  name = "Pumpkin Pie"
  description = <<DESCRIPTION
  Pumpkin pie is a dessert pie with a spiced, pumpkin-based custard filling.
  The pumpkin and pumpkin pie are both a symbol of harvest time, and pumpkin pie is generally eaten during the fall and early winter. 
  In the United States and Canada it is usually prepared for Thanksgiving,Christmas, and other occasions when pumpkin is in season.
  DESCRIPTION
  domain_name = module.home_pumpkin_hosting.domain_name
  #domain_name = "j7jd73h.cloudfront.net"
  town = "cooker-cove"
  content_version = var.pumpkin.content_version
}