# https://registry.terraform.io/providers/okta/okta/latest/docs/resources/policy_password_default
resource "okta_policy_password_default" "main" {
  # complexity rules
  password_dictionary_lookup  = true
  password_exclude_username   = true
  password_exclude_first_name = true
  password_exclude_last_name  = true
  password_history_count      = var.password_recipe.history_count
  password_min_length         = var.password_recipe.min_length
  password_min_lowercase      = var.password_recipe.require_lowercase ? 1 : 0
  password_min_uppercase      = var.password_recipe.require_uppercase ? 1 : 0
  password_min_number         = var.password_recipe.require_symbols ? 1 : 0
  password_min_symbol         = var.password_recipe.require_numbers ? 1 : 0

  # minimally and maximally allowed lifetimes
  password_expire_warn_days = (var.password_recipe.max_age - 14)
  password_min_age_minutes  = 0
  password_max_age_days     = var.password_recipe.max_age

  # lockout protocol
  password_auto_unlock_minutes   = var.password_recipe.unlock_minutes
  password_max_lockout_attempts  = var.password_recipe.max_attempts
  password_show_lockout_failures = true

  # recovery options
  email_recovery       = "ACTIVE"
  call_recovery        = "INACTIVE"
  sms_recovery         = "INACTIVE"
  question_recovery    = "ACTIVE"
  recovery_email_token = var.password_recipe.recovery_email_token_lifetime
}
