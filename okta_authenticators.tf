# see https://registry.terraform.io/providers/okta/okta/latest/docs/resources/authenticator
resource "okta_authenticator" "okta_email" {
  key    = "okta_email"
  name   = "Email"
  status = "ACTIVE"

  settings = jsonencode({
    "allowedFor" : "recovery"
    "tokenLifetimeInMinutes" : var.password_recipe.email_token_lifetime
  })
}

# see https://registry.terraform.io/providers/okta/okta/latest/docs/resources/authenticator
resource "okta_authenticator" "okta_password" {
  key    = "okta_password"
  name   = "Password"
  status = "ACTIVE"

  settings = jsonencode({
    "allowedFor" : "authentication"
  })
}

# see https://registry.terraform.io/providers/okta/okta/latest/docs/resources/authenticator
resource "okta_authenticator" "security_question" {
  key    = "security_question"
  name   = "Security Question"
  status = "ACTIVE"

  settings = jsonencode({
    "allowedFor" : "recovery"
  })
}

# see https://registry.terraform.io/providers/okta/okta/latest/docs/resources/authenticator
resource "okta_authenticator" "okta_verify" {
  key    = "okta_verify"
  name   = "Okta Verify"
  status = "ACTIVE"

  settings = jsonencode({
    "channelBinding" : {
      "required" : "HIGH_RISK_ONLY",
      "style" : "NUMBER_CHALLENGE",
    }

    "compliance" : {
      "fips" : "OPTIONAL"
    }

    "userVerification" : "PREFERRED"
  })
}
