#Output the AKS Cluster ID
output "aks_cluster_id" {
  description = "The ID of the AKS Cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.id  # This refers to the id of the AKS cluster resource
}

#Output the AKS Cluster Name (if needed)
output "aks_cluster_name" {
  description = "The Name of the AKS Cluster"
  value       = "akstest062002"  # This refers to the name of the AKS cluster resource
}

#Output the kube_config_raw for kubectl access
output "kube_config" {
  description = "The raw kubeconfig for accessing the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
}

#Optionally, output the role assignment ID (if you want to confirm the role assignment creation)
output "aks_acr_pull_role_assignment_id" {
  description = "The ID of the AKS ACR pull role assignment"
  value       = azurerm_role_assignment.aks_acr_pull.id
}

output "location" {
  value = "West US 2"
}

output "acr_name" {
  value = "acrtest062002"
}

output "ssh_key_data" {
  value = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCRC+FF0+zjkVOVziUPIWaqSGwDMEYpxgcbLnh/qZVILeJWZTQOiFu27gD1fUC0vGTqKTgr/gK7YjsyA36mMVEmXth0vDzmfe4HZiPmJXAMD7zWFPzp/SGcuuWCjJgRZygi8SLeClcT11L9IOQdIEkYhMGHaTHekt0XozF4RMpCLCnXkpdnzzs3M1Wbe9N2jl5fK5vy9m+0oEd7W4/j6xA+XrCBes47ptBgk8VRrJpMn3bO0PMMQ15Mg23BLA9r6hxjB7BrXlNtMe8SnsycyrDw3CiCzNmcGXladEzvDoSkksDTDz9lw5c6KOCT1/87p2f+ZLw2sT0x1sS+F/qmPJ0QZewIz9Wb5K+WNeNcUftVkao2/mUH+YF8tnron6ppbu2SEs0Bp8HD+E3y5zC9k7druBqukwJ1A3o2vT47n10HnGhtFbraJbAYjaAYhyhiHGOlIe/HZZdz5lrikY3XExXPVfH3Y1c48W741TwFs0eOqC4qeu/OWpz6zoWB69RR/GuQZifRDmIeoVgliynXfIEXYyDoQSqQIYCwomnwe51XPXHBWOCPUDoK0LH8HUO/tqHQR2nI4ElcyrqD5C5P9aNJdRY/51Qv0y5+aQ5QOgeGZnVIYMX5RpT1VFaQC38VfIucAWlR1nnh2tjqRiqM5mnNjXgeVe4UCrbdVKjzFdcvnQ== azureuser@myVm"
}