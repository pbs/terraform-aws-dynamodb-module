output "arn" {
  description = "ARN of the table"
  value       = module.ddb.arn
}

output "name" {
  description = "Name of the table"
  value       = module.ddb.name
}
