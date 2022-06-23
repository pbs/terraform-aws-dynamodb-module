locals {
  name = var.name != null ? var.name : var.product

  pay_per_request = var.billing_mode == "PAY_PER_REQUEST"

  min_capacity = local.pay_per_request ? null : var.prod_min_capacity != null ? var.environment == "prod" ? var.prod_min_capacity : var.min_capacity : var.min_capacity
  max_capacity = local.pay_per_request ? null : var.prod_max_capacity != null ? var.environment == "prod" ? var.prod_max_capacity : var.max_capacity : var.max_capacity

  range_key            = var.range_key == null ? null : var.range_key.name
  range_key_attributes = var.range_key == null ? [] : [var.range_key]

  additional_attributes = [for att in var.additional_attributes : {
    name = att.name
    type = att.type
  }]

  ttl = var.ttl != null ? { "${var.ttl}" = { enabled = true } } : {}

  creator = "terraform"

  tags = merge(
    var.tags,
    {
      Name                                      = local.name
      "${var.organization}:billing:product"     = var.product
      "${var.organization}:billing:environment" = var.environment
      creator                                   = local.creator
      repo                                      = var.repo
    }
  )
}
