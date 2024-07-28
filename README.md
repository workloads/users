# HCP Terraform Workspace `users`

> This repository manages user directories for [@workloads](https://github.com/workloads).

## Table of Contents

<!-- TOC -->
* [HCP Terraform Workspace `users`](#hcp-terraform-workspace-users)
  * [Table of Contents](#table-of-contents)
  * [Requirements](#requirements)
    * [Development](#development)
  * [Usage](#usage)
    * [Inputs](#inputs)
    * [Outputs](#outputs)
  * [Notes](#notes)
    * [Sensitive Data](#sensitive-data)
  * [Contributors](#contributors)
  * [License](#license)
<!-- TOC -->

## Requirements

- HashiCorp Terraform `1.9.x` or [newer](https://developer.hashicorp.com/terraform/downloads)

### Development

For development and testing of this repository:

- `terraform-docs` `0.18.0` or [newer](https://terraform-docs.io/user-guide/installation/)

## Usage

This repository uses a standard Terraform workflow (`init`, `plan`, `apply`).

For more information, including detailed usage guidelines, see the [Terraform documentation](https://developer.hashicorp.com/terraform/cli/commands).

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| management_region_aws | AWS-specific `Management` Region Identifier. | `string` | yes |
| okta_api_token | This is the API token to interact with your Okta organization. | `string` | yes |
| okta_org_name | This is the organization name of your Okta account. | `string` | yes |
| okta_social_login_github_client_id | Client ID of GitHub Application for Okta Social Login. | `string` | yes |
| okta_social_login_github_client_secret | Client Secret of GitHub Application for Okta Social Login. | `string` | yes |
| project_identifier | Human-readable Project Identifier. | `string` | yes |
| tfe_team_token_viewers | HCP Terraform `viewers` Team Token. | `string` | yes |
| okta_backoff | Whether to use exponential back off strategy for rate limits. | `bool` | no |
| okta_base_url | This is the base URL of your Okta account. | `string` | no |
| password_recipe | Complex Object of configuration for Password Recipes. | <pre>object({<br>    unlock_minutes                = number<br>    email_token_lifetime          = number<br>    history_count                 = number<br>    max_age                       = number<br>    max_attempts                  = number<br>    min_length                    = number<br>    recovery_email_token_lifetime = number<br>    require_lowercase             = bool<br>    require_uppercase             = bool<br>    require_symbols               = bool<br>    require_numbers               = bool<br>  })</pre> | no |

### Outputs

| Name | Description |
|------|-------------|
| okta_authenticator_okta_email | Exported Attributes for `okta_authenticator.okta_email`. |
| okta_authenticator_okta_password | Exported Attributes for `okta_authenticator.okta_password`. |
| okta_authenticator_okta_verify | Exported Attributes for `okta_authenticator.okta_verify`. |
| okta_authenticator_security_question | Exported Attributes for `okta_authenticator.security_question`. |
| okta_idp_social_github | Exported Attributes for `okta_idp_social.github`. |
| okta_org_configuration | Exported Attributes for `okta_org_configuration`. |
| tfe_workspace_terraform_version | Terraform version identifier of current HCP Terraform Workspace. |
<!-- END_TF_DOCS -->

## Notes

### Sensitive Data

Terraform state may contain [sensitive data](https://developer.hashicorp.com/terraform/language/state/sensitive-data). This workspace uses [HCP Terraform](https://developer.hashicorp.com/terraform/cloud-docs) to safely store state, and encrypt the data at rest.

## Contributors

For a list of current (and past) contributors to this repository, see [GitHub](https://github.com/workloads/users/graphs/contributors).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may download a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

See the License for the specific language governing permissions and limitations under the License.
