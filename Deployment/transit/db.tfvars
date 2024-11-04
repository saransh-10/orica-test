rg_name     = "orica-transit-net-rg-01"
org_name    = "orica"
bu_name     = "transit"
environment = "transit"
databricksWorkspace = {
  sku = "premium"
}
tags = {
  "owner" = "orica"
}
publicNetworkAccessEnabled = true
existingVnetName           = "orica-transit-vnet-01"
