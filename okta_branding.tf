# `okta_brand` can only be modified after first importing it using `terraform import`.
# Steps:
# 1.) create an `okta_brands` data source and output the value
#
# ```hcl
#   data "okta_brands" "main" {}
#
#   output "okta_brand_import_command" {
#     value = "terraform import okta_brand.main ${one(data.okta_brands.main.brands[*].id)}"
#   }
# ```
#
# 2.) Use the output of `okta_brand_import_command` to import the Okta Brand into Terraform State
#
# `terraform import okta_brand.main <Okta Brand ID>`
#
# 3.) Use the `okta_brand` Terraform resource as normal
#
# also see https://registry.terraform.io/providers/okta/okta/latest/docs/resources/brand
resource "okta_brand" "main" {
  agree_to_custom_privacy_policy = true
  custom_privacy_policy_url      = "https://go.workloads.io/privacy-policy"
  name                           = "${var.okta_org_name}_default"

  # be grateful for free Okta Organizations
  remove_powered_by_okta = false
}

# see https://registry.terraform.io/providers/okta/okta/latest/docs/data-sources/brands
data "okta_brands" "main" {}

# see https://registry.terraform.io/providers/okta/okta/latest/docs/data-sources/themes
#data "okta_themes" "main" {
#  brand_id = tolist(data.okta_brands.main.brands)[0].id
#}

# `okta_theme` can only be modified after first importing it using `terraform import`.
# Steps:
# 1.) create `okta_brands` and `okta_theme` data sources and output the value
#
# ```hcl
#   data "okta_brands" "main" {}
#
#   data "okta_themes" "main" {
#     brand_id = tolist(data.okta_brands.main.brands)[0].id
#   }
#
#   output "okta_theme_import_command" {
#     value = "terraform import okta_theme.main '${data.okta_themes.main.brand_id}/${one(data.okta_themes.main.themes).id}'"
#   }
# ```
#
# 2.) Use the output of `okta_brand_import_command` to import the Okta Brand into Terraform State
#
# `terraform import okta_brand.main <Okta Brand ID>`
#
# 3.) Use the `okta_theme` Terraform resource as normal
#
# also see https://registry.terraform.io/providers/okta/okta/latest/docs/resources/theme
resource "okta_theme" "main" {
  brand_id = element(data.okta_brands.main.brands[*].id, 0)

  # format must be 420x120 pixels
  logo = "./assets/logo.png"

  # format must be (at most) 512x512 pixels
  favicon = "./assets/favicon.png"

  # remove any non-Terraform-managed background image
  background_image = ""

  primary_color_hex          = "#282433"
  primary_color_contrast_hex = "#ffffff"

  secondary_color_hex          = "#282433"
  secondary_color_contrast_hex = "#ffffff"

  # uses logo and favicon from theme configuration; sets background color to `secondary_color_hex`
  sign_in_page_touch_point_variant = "BACKGROUND_SECONDARY_COLOR"

  # uses logo and favicon from theme configuration; sets background color to white
  end_user_dashboard_touch_point_variant = "LOGO_ON_FULL_WHITE_BACKGROUND"

  # uses logo and favicon from theme configuration; sets background color to `secondary_color_hex`
  error_page_touch_point_variant = "BACKGROUND_SECONDARY_COLOR"

  # uses logo and favicon from theme configuration
  email_template_touch_point_variant = "FULL_THEME"
}
