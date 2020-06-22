resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_app_service_plan" "example" {
  name                = "example-appserviceplan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "example" {
  name                = "example-app-service-hftt46hs"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    dotnet_framework_version = "v2.0"
    # scm_type                 = "GitHub"
  }

  app_settings = {
    "WEBSITE_NODE_DEFAULT_VERSION"   = "10.15.2"
     "ApiUrl" = ""
     "ApiUrlShoppingCart" = ""
      "MongoConnectionString" = ""
      "SqlConnectionString" = ""
     "productImagesUrl"	= "https://raw.githubusercontent.com/microsoft/TailwindTraders-Backend/master/Deploy/tailwindtraders-images/product-detail"
      "Personalizer__ApiKey" = ""
      "Personalizer__Endpoint"	= ""
     }

}
