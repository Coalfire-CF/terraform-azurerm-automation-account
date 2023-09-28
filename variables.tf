variable "automation_account_name" {
  description = "Name of the Automation Account"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group of Automation Account"
  type        = string
}

variable "location" {
  description = "The Azure location/region to create resources in."
  type        = string
}

variable "global_tags" {
  type        = map(string)
  description = "Global level tags"
}

variable "regional_tags" {
  type        = map(string)
  description = "Regional level tags"
}

variable "log_analytics_workspace_id" {
  description = "ID of the Log Analytics Workspace diagnostic logs should be sent to"
  type        = string
}
