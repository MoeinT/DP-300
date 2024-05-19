
module "WindowsVM" {
  source = "../../CommonModules/windowsVM"
  properties = {
    "dp-300-vm-${var.env}" = {
      resource_group_name   = module.Rg.rg-names["dp-300-${var.env}"],
      location              = module.Rg.rg-locations["dp-300-${var.env}"],
      admin_username        = var.admin_username,
      admin_password        = var.admin_password,
      size                  = "Standard_D2s_v3"
      network_interface_ids = [module.NICs.nic-id["dp-300-nic-${var.env}"]]
      boot_diagnostics      = {}
    }
  }
}
