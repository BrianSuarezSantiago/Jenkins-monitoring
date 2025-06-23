# Creates an Amazon Managed Service for Prometheus (AMP) Workspace
resource "aws_prometheus_workspace" "prometheus_workspace" {
  alias = var.prometheus_workspace_alias

  tags = {
    Environment = var.environment_tag
  }
}
