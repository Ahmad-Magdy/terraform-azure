variable "resource_group_name" {
  description="The resource group name"
}
variable "app_service_name" {
  description="app service actual name"
}

variable "location" {
  description = "The Azure location where all resources should be created"
}
variable "environment" {
  description = "Test, staging or production"
}