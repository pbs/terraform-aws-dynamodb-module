module "ddb" {
  source = "../.."

  ttl = "ttl"

  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo
}
