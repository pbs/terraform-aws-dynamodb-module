module "ddb" {
  source = "../.."

  range_key = {
    name = "LSIRange"
    type = "N"
  }

  local_secondary_indices = {
    "lsi_name" = {
      range_key          = "LSIRange"
      projection_type    = "INCLUDE"
      non_key_attributes = ["LSIProjected"]
    }
  }

  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo
}
