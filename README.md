# Terraform Cloud Workspace `users`

> This directory manages User Directories and Configuration for [@workloads](https://github.com/workloads).

## Table of Contents

<!-- TOC -->
* [Terraform Cloud Workspace `users`](#terraform-cloud-workspace-users)
  * [Table of Contents](#table-of-contents)
  * [Requirements](#requirements)
  * [Usage](#usage)
    * [Inputs](#inputs)
    * [Outputs](#outputs)
  * [Author Information](#author-information)
  * [License](#license)
<!-- TOC -->

## Requirements

- HashiCorp Terraform `1.6.x` or [newer](https://developer.hashicorp.com/packer/downloads)

Optional, and only needed for documentation generation:

- `terraform-docs` `0.16.0` or [newer](https://terraform-docs.io/user-guide/installation/)

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
| project_identifier | Human-readable Project Identifier. | `string` | yes |
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
| okta_org_configuration | Exported Attributes for `okta_org_configuration`. |
<!-- END_TF_DOCS -->

## Author Information

This repository is maintained by the contributors listed on [GitHub](https://github.com/workloads/users/graphs/contributors).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
