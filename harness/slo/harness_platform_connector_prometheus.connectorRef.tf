resource "harness_platform_connector_prometheus" "connectorRef" {
  identifier  = "connectorRef"
  name        = "connectorRef"
  description = "prometheus"
  tags        = ["foo:bar"]
  org_id = "cvng"
  project_id = "ecommerce"
  delegate_selectors = ["chi-play-prod2-small"]
  url = "http://10.4.2.99:80/health-source/prometheus/"
}
