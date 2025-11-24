
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "project_name" {
  description = "Base project name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}

module "rg" {
  source   = "../../visheshDay1/modules"
  name     = "${var.project_name}-rg-dev"
  location = var.location
  tags     = var.tags
}

output "rg_name"     { value = module.rg.name }
output "rg_location" { value = module.rg.location }
