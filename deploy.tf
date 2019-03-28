# Configure the Azure provider
provider "azurerm" {
    subscription_id = "Your subscription ID"
}

resource "azurerm_resource_group" "mymain" {
  name     = "${var.resource_group_name}"
  location = "${var.location}"
}

resource "azurerm_app_service_plan" "mymain" {
  name                = "${var.location}AppServicePlan"
  location            = "${azurerm_resource_group.mymain.location}"
  resource_group_name = "${azurerm_resource_group.mymain.name}"

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "mymain" {
  name                = "${var.resource_group_name}-${var.location}-${var.environment}"
  location            = "${azurerm_resource_group.mymain.location}"
  resource_group_name = "${azurerm_resource_group.mymain.name}"
  app_service_plan_id = "${azurerm_app_service_plan.mymain.id}"
}

resource "azurerm_app_service_slot" "mymain" {
  name                = "${var.resource_group_name}-slot"
  location            = "${azurerm_resource_group.mymain.location}"
  resource_group_name = "${azurerm_resource_group.mymain.name}"
  app_service_plan_id = "${azurerm_app_service_plan.mymain.id}"
  app_service_name    = "${azurerm_app_service.mymain.name}"
}

resource "azurerm_key_vault" "mymain" {
  name                        = "${var.app_service_name}-keyvault"
  location                    = "${azurerm_resource_group.mymain.location}"
  resource_group_name         = "${azurerm_resource_group.mymain.name}"
  enabled_for_disk_encryption = true
  tenant_id                   = "Your TenantID"

  sku {
    name = "standard"
  }
}
