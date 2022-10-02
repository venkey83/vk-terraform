terraform {
 required_providers {
   aws = {
     source  = "hashicorp/aws"
     version = "~> 4.0"
   }
 }
}

provider "aws" {
  region = "us-east-2"
    access_key = "AKIARGQWTNIOZOVAOOQG"
    secret_key = "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"
}

