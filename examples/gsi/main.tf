module "ddb" {
  source = "../.."

  additional_attributes = [
    {
      name = "GSIHash"
      type = "S"
    },
    {
      name = "GSIRange"
      type = "N"
    }
  ]

  global_secondary_indices = {
    "gsi_name" = {
      hash_key           = "GSIHash"
      range_key          = "GSIRange"
      projection_type    = "INCLUDE"
      non_key_attributes = ["GSIProjected"]
    }
  }

  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo
}
