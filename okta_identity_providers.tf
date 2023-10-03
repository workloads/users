# see https://registry.terraform.io/providers/okta/okta/latest/docs/resources/idp_social
resource "okta_idp_social" "github" {
  account_link_action  = "AUTO"
  client_id            = var.okta_social_login_github_client_id
  client_secret        = var.okta_social_login_github_client_secret
  deprovisioned_action = "NONE"
  issuer_mode          = "DYNAMIC"
  name                 = "GitHub (Org: ${var.project_identifier})"
  profile_master       = true
  protocol_type        = "OIDC"
  provisioning_action  = "AUTO"

  # see https://docs.github.com/en/developers/apps/building-oauth-apps/scopes-for-oauth-apps
  scopes = [
    "user",
  ]

  status = "ACTIVE"

  # matches against Okta Username or (GitHub) Email
  # see https://registry.terraform.io/providers/okta/okta/latest/docs/resources/idp_social#subject_match_type
  subject_match_type = "EMAIL"

  suspended_action = "NONE"

  # see https://developer.okta.com/docs/reference/api/idps/#identity-provider-type
  type = "GITHUB"

  # see https://developer.okta.com/docs/guides/social-login/github/main/#handle-users-without-email-addresses
  username_template = "idpuser.email == null ? idpuser.externalId + '@github.example.com' : idpuser.email"
}

# TODO: add routing: https://github.com/okta/terraform-provider-okta/issues/1531
