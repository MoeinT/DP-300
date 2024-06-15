# Create a NIC and associate it to the Public IP
# module "NICs" {
#   source = "../../CommonModules/NetworkInterface"
#   properties = {
#     # Nic VM
#     "dp-300-nic-${var.env}" = {
#       location            = module.Rg.rg-locations["dp-300-${var.env}"],
#       resource_group_name = module.Rg.rg-names["dp-300-${var.env}"],
#       ip_configuration = {
#         name                          = "internal",
#         subnet_id                     = module.Subnets.subnet-id["dp-300-subnet-${var.env}"],
#         private_ip_address_allocation = "Dynamic",
#         public_ip_address_id          = module.publicIPs.publicIp-id["dp-300-public-ip-${var.env}"]
#       }
#     }
#   }
# }
