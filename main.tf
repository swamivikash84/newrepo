resource "azurerm_resource_group" "rg" {
    for_each = var.rgname
  name     = each.value.name
  location = each.value.location
}



resource "azurerm_virtual_network" "vnet" {
  for_each = var.rgname

  name                = each.value.vnetname
  address_space       = each.value.address_space
  location            = each.value.location
  resource_group_name = each.value.name
}

resource "azurerm_subnet" "modulesubnet" {
  for_each = var.rgname
  name                 = each.value.subnetname
  resource_group_name  = each.value.name
  virtual_network_name = each.value.vnetname
  address_prefixes     = each.value.address_prefixes
  
}


resource "azurerm_storage_account" "modulestorage" {
  for_each = var.rgname
  name                = each.value.storageaccountname
  resource_group_name = each.value.name

  location                 = each.value.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}









