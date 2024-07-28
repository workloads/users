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

variable "okta_social_login_github_client_id" {
  type        = string
  description = "Client ID of GitHub Application for Okta Social Login."
}

variable "okta_social_login_github_client_secret" {
  type        = string
  description = "Client Secret of GitHub Application for Okta Social Login."
  sensitive   = true
}

variable "password_recipe" {
  type = object({
    unlock_minutes                = number
    email_token_lifetime          = number
    history_count                 = number
    max_age                       = number
    max_attempts                  = number
    min_length                    = number
    recovery_email_token_lifetime = number
    require_lowercase             = bool
    require_uppercase             = bool
    require_symbols               = bool
    require_numbers               = bool
  })

  description = "Complex Object of configuration for Password Recipes."

  default = {
    # value in minutes
    unlock_minutes = 10

    # value in minutes
    email_token_lifetime = 10

    # value in counts of password iterations
    history_count = 2

    # value in days
    max_age = 92

    # value in counts of incorrect password submissions
    max_attempts = 5

    # value in characters
    min_length = 12

    # value in minutes
    recovery_email_token_lifetime = 60

    require_lowercase = true
    require_uppercase = true
    require_symbols   = true
    require_numbers   = true
  }
}

variable "project_identifier" {
  type        = string
  description = "Human-readable Project Identifier."
}

variable "tfe_team_token_viewers" {
  type        = string
  description = "HCP Terraform `viewers` Team Token."
  sensitive   = true
}
