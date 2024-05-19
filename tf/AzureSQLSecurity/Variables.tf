variable "env" {
  description = "Environment for resources"
  type        = string
  validation {
    condition     = contains(["dev", "test", "qa", "prod"], var.env)
    error_message = "Environment should be either: dev, test, qa or prod."
  }
}

variable "admin_username" {
  type      = string
  sensitive = true
  validation {
    condition     = length(var.admin_username) >= 8
    error_message = "The username should have at least 8 characters."
  }
}

variable "admin_password" {
  type      = string
  sensitive = true

  validation {
    condition     = can(regex("[a-z]", var.admin_password)) && can(regex("[A-Z]", var.admin_password)) && can(regex("[0-9]", var.admin_password)) && length(var.admin_password) >= 8
    error_message = "Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one number."
  }
}
