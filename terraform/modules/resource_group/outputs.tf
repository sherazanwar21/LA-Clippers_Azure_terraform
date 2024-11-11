output "resource_group_name" {
  description = "The name of the resource group"
  value       = "rg062002"
}

output "resource_group_id" {
  description = "The ID of the resource group"
  value       = azurerm_resource_group.aks_rg.id
}

output "location" {
  value = "West US 2"
}