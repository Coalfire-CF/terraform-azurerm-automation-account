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

variable "tags" {
  description = "Tags applied to the Automation Account."
  type        = map(string)
  default     = {}
}

variable "log_analytics_workspace_id" {
  description = "ID of the Log Analytics Workspace diagnostic logs should be sent to"
  type        = string
}

variable "public_network_access_enabled" {
  description = "Allow access from public networks. Default false. Setting true exposes the webhook, DSC and hybrid worker endpoints to the internet. With false, callers reach the account through a private endpoint they create."
  type        = bool
  default     = false
}

variable "local_authentication_enabled" {
  description = "Allow key-based (local) authentication. Default false. Setting true enables webhooks, DSC node registration keys and agent-based hybrid workers that authenticate with keys instead of Entra ID."
  type        = bool
  default     = false
}
