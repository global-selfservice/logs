module "logs" {
  source = "github.com/global-devops-terraform/k8s-logs?ref=v0.73.0"

  read_access_groups = {
    "devaccess" = ["devaccess"]
  }

  cluster_name                    = local.cluster_name
  elasticsearch_username          = local.elasticsearch_username
  elasticsearch_password          = local.elasticsearch_password
  elasticsearch_exporter_username = local.elasticsearch_exporter_username
  elasticsearch_exporter_password = local.elasticsearch_exporter_password
  es_endpoint                     = local.elasticsearch_host
  es_port                         = local.elasticsearch_port
}

locals {
  elasticsearch_parts    = split(":", local.elasticsearch_url)
  elasticsearch_protocol = upper(local.elasticsearch_parts[0])
  elasticsearch_port     = local.elasticsearch_parts[2]
  elasticsearch_host     = trimprefix(local.elasticsearch_parts[1], "//")
}
