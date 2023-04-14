# may be imported like so: `terraform import okta_org_configuration.main _`
# see https://registry.terraform.io/providers/okta/okta/latest/docs/resources/org_configuration
resource "okta_org_configuration" "main" {
  company_name = var.project_identifier

  # TODO: enable AWS-retrieved URL when AWS provider is active
  website                      = "https://workloads.io"
  city                         = "Amsterdam"
  country                      = "Netherlands"
  postal_code                  = "1014ZG"
  opt_out_communication_emails = true
}
