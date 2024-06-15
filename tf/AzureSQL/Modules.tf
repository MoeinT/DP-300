module "azure" {
  source         = "./azure"
  env            = var.env
  admin_username = var.admin_username
  admin_password = var.admin_password
}
