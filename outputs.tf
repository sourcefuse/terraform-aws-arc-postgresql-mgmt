#ssm parameters
output "arn" {
  description = "ARN of the parameter"
  value       = [for x in aws_ssm_parameter.this : x.arn]
}
