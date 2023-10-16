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
    # see https://registry.terraform.io/providers/hashicorp/aws/5.20.0
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.20.0, < 6.0.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/hcp/0.72.2
    hcp = {
      source  = "hashicorp/hcp"
      version = ">= 0.72.2, < 1.0.0"
    }

    # see https://registry.terraform.io/providers/okta/okta/4.4.2
    okta = {
      source  = "okta/okta"
      version = "4.4.3"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-a-required-terraform-version
  required_version = ">= 1.6.0, < 2.0.0"
}
