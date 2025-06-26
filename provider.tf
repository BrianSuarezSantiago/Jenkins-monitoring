# Specify the provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    grafana = {
      source  = "grafana/grafana"
      version = "3.25.3"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

provider "grafana" {
  auth = aws_grafana_workspace_service_account_token.grafana_service_account_token.key
  url  = "https://${aws_grafana_workspace.grafana_workspace.endpoint}"
}
