terraform {
  backend "azurerm" {
    resource_group_name  = "rgr-name"
    storage_account_name = "accountname"
    container_name       = "state"
  }
}
