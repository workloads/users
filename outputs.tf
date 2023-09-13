output "okta_org_configuration" {
  description = "Exported Attributes for `okta_org_configuration`."
  value       = okta_org_configuration.main
}

#output "okta_brand" {
#  description = "Exported Attributes for `okta_brand`."
#  value       = okta_brand.main
#}

output "okta_idp_social_github" {
  description = "Exported Attributes for `okta_idp_social.github`."
  value       = okta_idp_social.github
  sensitive   = true
}

#output "okta_theme" {
#  description = "Exported Attributes for `okta_theme`."
#  value       = okta_theme.main
#}

output "okta_authenticator_okta_email" {
  description = "Exported Attributes for `okta_authenticator.okta_email`."
  value       = okta_authenticator.okta_email
  sensitive   = true
}

output "okta_authenticator_okta_password" {
  description = "Exported Attributes for `okta_authenticator.okta_password`."
  value       = okta_authenticator.okta_password
  sensitive   = true
}

output "okta_authenticator_security_question" {
  description = "Exported Attributes for `okta_authenticator.security_question`."
  value       = okta_authenticator.security_question
  sensitive   = true
}

output "okta_authenticator_okta_verify" {
  description = "Exported Attributes for `okta_authenticator.okta_verify`."
  value       = okta_authenticator.okta_verify
  sensitive   = true
}
