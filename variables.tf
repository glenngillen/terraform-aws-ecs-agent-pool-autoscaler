variable "org_name" {
  description = "Organization to create agent pool in."
}

variable "name" {
  description = "Name for the agent pool & resources."
}

variable "max_count" {
  description = "Maximum count of tfc-agents to run."
  default     = 2
}

variable "cluster_name" {
  description = "Name of the ECS cluster to manage scaling of."
}

variable "service_name" {
  description = "Name of the ECS service to manage."
}

variable "workspace_name" {
  description = "Name of the workspace to attach to this agent pool"
}