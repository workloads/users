# The Okta Provider is set to retrieve configuration from `variables.tf` and the environment
# see https://registry.terraform.io/providers/okta/okta/latest/docs#schema
provider "okta" {
  org_name  = var.okta_org_name
  base_url  = var.okta_base_url
  api_token = var.okta_api_token
}
