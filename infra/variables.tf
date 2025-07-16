variable "environment" {
  description = "The deployment environment (dev, staging, prod)"
  type        = string
}

variable "location" {
  description = "Azure region to deploy to"
  type        = string
  default     = "East US"
}
