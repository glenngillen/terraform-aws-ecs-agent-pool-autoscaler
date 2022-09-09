# Terraform Cloud Autoscaling Agent Pool (Fargate)

A Terraform module to deploy Terraform Cloud self-hosted agents
that will run on ECS Fargate, and scale dynamically in response
to various run notification events on the attached workspace
on Terraform Cloud.

## Setup

* Set the `TFE_TOKEN` environment variable. It'll need to be a highly permissive token (i.e., on the `owners` team) as it needs to be able to create a new agent pool at an organizational level.
* Set the relevant variables to configure your AWS provider.

## Usage

```hcl
locals = {
  tfc_org_name = "acme-org"
  agents_name   = "acme-agents"
}

module "agents" {
  source            = "glenngillen/ecs-agent-pool/module"
  version           = "1.0.0"

  org_name          = local.tfc_org_name
  name              = local.agents_name
}

module "agent-scaler" {
  source            = "glenngillen/ecs-agent-pool-autoscaler/module"
  version           = "1.0.0"

  org_name          = local.tfc_org_name
  name              = local.agents_name
  workspace_name    = "my-terraform-cloud-workspace-here"

  cluster_name      = module.agents.cluster_name
  service_name      = module.agents.service_name
}
```