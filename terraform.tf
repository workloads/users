terraform {
  # see https://developer.hashicorp.com/terraform/language/settings/terraform-cloud
  cloud {
    # see https://app.terraform.io/app/workloads/workspaces
    # and https://developer.hashicorp.com/terraform/cli/cloud/settings#organization
    organization = "workloads"

    # see https://app.terraform.io/app/workloads/users
    # and https://developer.hashicorp.com/terraform/cli/cloud/settings#workspaces
    workspaces {
      name = "users"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-provider-requirements
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/aws/5.10.0
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.10.0, < 6.0.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/hcp/0.67.0
    hcp = {
      source  = "hashicorp/hcp"
      version = ">= 0.67.0, < 1.0.0"
    }

    # see https://registry.terraform.io/providers/okta/okta/4.1.0
    okta = {
      source  = "okta/okta"
      version = "4.1.0"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-a-required-terraform-version
  required_version = ">= 1.5.0, < 2.0.0"
}
