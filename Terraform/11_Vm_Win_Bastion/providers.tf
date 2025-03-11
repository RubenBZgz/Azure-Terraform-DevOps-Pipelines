terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.12.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  #resource_provider_registrations = "none" # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
  subscription_id = var.subscription_id
}

#az login
#az account show
#az login --tenant "YOUR TENANT ID"
#az account set --subscription <subscription_id>
#terraform login
#You are ready to use terraform in your local machine

#terraform -chdir=Terraform\11_Vm_Win_Bastion\ init
#checkov -d .\Terraform\11_Vm_Win_Bastion\
#tfsec .\Terraform\11_Vm_Win_Bastion\