variable "automation_account_name" {
  description = "Name of the Automation Account."
  type        = string
}

variable "resource_group_name" {
  description = "Name of an existing resource group, owned by the caller."
  type        = string
}

variable "location" {
  description = "Azure Government region."
  type        = string
  default     = "usgovvirginia"
}

variable "log_analytics_workspace_id" {
  description = "ID of an existing Log Analytics workspace, owned by the caller."
  type        = string
}

variable "tags" {
  description = "Tags applied to the Automation Account."
  type        = map(string)
  default     = {}
}
