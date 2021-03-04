data "vault_generic_secret" "fluentd" {
  path = "secret/selfservice/envs/${local.environment}/elasticsearch/fluentd"
}

data "vault_generic_secret" "exporter" {
  path = "secret/selfservice/envs/${local.environment}/elasticsearch/exporter"
}

locals {
  elasticsearch_url               = data.vault_generic_secret.fluentd.data["url"]
  elasticsearch_username          = data.vault_generic_secret.fluentd.data["username"]
  elasticsearch_password          = data.vault_generic_secret.fluentd.data["password"]
  elasticsearch_exporter_username = data.vault_generic_secret.exporter.data["username"]
  elasticsearch_exporter_password = data.vault_generic_secret.exporter.data["password"]
}
