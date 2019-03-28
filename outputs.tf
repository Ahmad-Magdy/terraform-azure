output "app_service_name" {
  value = "${azurerm_app_service.mymain.name}"
}

output "app_service_default_hostname" {
  value = "https://${azurerm_app_service.mymain.default_site_hostname}"
}
output "vault_uri" {
  value = "${azurerm_key_vault.mymain.vault_uri}"
}