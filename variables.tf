variable "management_region_aws" {
  type        = string
  description = "AWS-specific `Management` Region Identifier."
}

# see https://registry.terraform.io/providers/okta/okta/latest/docs#org_name
variable "okta_org_name" {
  type        = string
  description = "This is the organization name of your Okta account."
}

# see https://registry.terraform.io/providers/okta/okta/latest/docs#api_token
# and https://<Okta subdomain>-admin.okta.com/admin/access/api/tokens
variable "okta_api_token" {
  type        = string
  description = "This is the API token to interact with your Okta organization."
  sensitive   = true
}

# see https://registry.terraform.io/providers/okta/okta/latest/docs#backoff
variable "okta_backoff" {
  type        = bool
  description = "Whether to use exponential back off strategy for rate limits."
  default     = true
}

# see https://registry.terraform.io/providers/okta/okta/latest/docs#base_url
variable "okta_base_url" {
  type        = string
  description = "This is the base URL of your Okta account."
  default     = "okta.com" # generally either `okta.com` or `oktapreview.com`, but other values are possible (specifically: PubSec settings)
}

variable "project_identifier" {
  type        = string
  description = "Human-readable Project Identifier."
}
