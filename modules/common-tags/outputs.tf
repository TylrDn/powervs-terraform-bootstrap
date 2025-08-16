output "tags" {
  description = "Base tags"
  value = [
    "owner=${var.owner}",
    "env=${var.environment}",
    "cost_center=${var.cost_center}",
    "project=${var.project}"
  ]
}
