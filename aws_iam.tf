# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_account_password_policy
resource "aws_iam_account_password_policy" "main" {
  allow_users_to_change_password = true
  hard_expiry                    = false

  minimum_password_length = var.password_recipe.min_length
  max_password_age        = var.password_recipe.max_age

  # current password may not be identical to previous password
  password_reuse_prevention = var.password_recipe.history_count

  require_lowercase_characters = true
  require_numbers              = true
  require_uppercase_characters = true
  require_symbols              = true
}
