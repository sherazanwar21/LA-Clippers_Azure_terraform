resource "azurerm_container_registry" "aks_acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                  = "Basic"
  admin_enabled       = true
}