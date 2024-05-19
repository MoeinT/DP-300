module "Rg" {
  source = "../../CommonModules/ResourceGroups"
  env    = var.env
  properties = {
    "dp-300-${var.env}" = {
      location = "West Europe"
    }
  }
}
