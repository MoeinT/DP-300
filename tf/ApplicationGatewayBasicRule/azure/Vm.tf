# Create an availability set for the Virtual Machines
module "AvailabilitySets" {
  source = "../../CommonModules/AzurermAvailabilitySet"
  properties = {
    "vm-availabilityset-${var.env}" = {
      resource_group_name          = module.Rg.rg-names["az-104-${var.env}"],
      location                     = module.Rg.rg-locations["az-104-${var.env}"],
      platform_update_domain_count = 5
      platform_fault_domain_count  = 2
    }
  }
}

# Define a windows Virtual Machine
module "WindowsVM" {
  source = "../../CommonModules/windowsVM"
  properties = {
    "images-vm-${var.env}" = {
      resource_group_name   = module.Rg.rg-names["az-104-${var.env}"],
      location              = module.Rg.rg-locations["az-104-${var.env}"],
      admin_username        = var.vm_admin_username,
      admin_password        = var.vm_admin_password,
      size                  = "Standard_D2s_v3"
      network_interface_ids = [module.NICs.nic-id["nic-windows-${var.env}"]]
      availability_set_id   = module.AvailabilitySets.availability-set-id["vm-availabilityset-${var.env}"]
      boot_diagnostics      = {}
    }
  }
}

# Define a Linux Virtual Machine 
module "LinuxVM" {
  source = "../../CommonModules/LinuxVM"
  properties = {
    # using password for authentication
    "video-vm-${var.env}" = {
      resource_group_name   = module.Rg.rg-names["az-104-${var.env}"],
      location              = module.Rg.rg-locations["az-104-${var.env}"],
      size                  = var.vm_size
      admin_username        = var.vm_admin_username
      admin_password        = var.vm_admin_password
      network_interface_ids = [module.NICs.nic-id["nic-linux-${var.env}"]]
      custom_data           = data.template_cloudinit_config.cloud_config_linux.rendered
      availability_set_id   = module.AvailabilitySets.availability-set-id["vm-availabilityset-${var.env}"]
      boot_diagnostics      = {}
    }
  }
}