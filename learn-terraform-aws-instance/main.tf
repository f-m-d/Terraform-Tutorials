terraform {


# NB:COMMENT THE "backend" PART WHOLE TO RUN IT ON AWS!
# Otherwise, to run all on TERRAFORM CLOUD:
# # Change the "organization" value as the organization name on Terraform Cloud
# # Change the "workspaces.name" as a name you want as workspace
# # RUN "terraform login" from terminal
# # Login web to Terraform Cloud
# # Paste the secret token in terminal
# # Run "terraform init" to initialize and migrate to Terraform Cloud
# # If asked about migration state copy from local to remote, say "yes"
# # Once migrated to Terraform Cloud, you should remove your local state file "rm terraform.tfstate" (or leave it, whatever)

# If you run you commands locally on Terraform, it will run commands on your local machine and save the state (the same in terraform.tfstate) on Terraform Cloud

# To configure AWS Variables su Terraform Cloud (to authenticate on AWS from Terraform Cloud)
# # Login on Terraform Cloud
# # Go to the chosen organization
# # Go to the chosen Workspace
# # Go on "Variables" (on the left)
# # On "Workspace Variables -> Enviroment Variables"
# # Add the Access Key and Secret Access Key (AWS_ACCESS_KEY_ID :: <ACCESS_KEY>, AWS_SECRET_ACCESS_KEY :: <SECRET_ACCESS_KEY>) from IaM AWS Key binded to user 
# # Now run "terraform apply" to trigger a run in Terraform Cloud
# # In the end, run "terraform destroy" to destroy the elements configured previously
# # To logout, try "terraform logout"
  backend "remote" {
    organization = "frank-organization"
     workspaces {
       name = "learn-tfc-aws"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-09ac7e749b0a8d2a1"
#  ami           = "ami-0e2e9c570f999a4c8"
  instance_type = "t2.micro"

  tags = {
#    Name = "ExampleAppServerInstance"
     Name = var.instance_name
  }
}
