resource "harness_platform_monitored_service" "service_ref_environment_ref" {
  depends_on = [
    harness_platform_connector_prometheus.connectorRef
  ]

  org_id     = "cvng"
  project_id = "ecommerce"
  identifier = "service_ref_environment_ref"
  request {
    name = "service_ref_environment_ref"
    type = "Application"
    description = "new_description_new"
    service_ref = "service_ref"
    environment_ref = "environment_ref"
    tags = ["foo:bar", "bar:foo"]
    health_sources {
      name = "prometheus"
      identifier = "prometheus"
      type = "Prometheus"
      spec = jsonencode({
        connectorRef = "connectorRef"
        feature = "feature"
        metricDefinitions = [
          {
            identifier   = "prometheus_metric"
            metricName = "Prometheus Metric"
            riskProfile = {
              category =  "Errors"
            }
            sli =  {
              enabled =  true
            },
            query = "sum(abc{identifier=\"slo-ratiobased-unsuccessfulCalls-datapattern\"})",
            groupName = "t2",
            isManualQuery = true
          }
        ]
      })
    }
    change_sources {
      name = "csName2"
      identifier = "harness_cd_next_gen"
      type = "HarnessCDNextGen"
      enabled = true
      spec = jsonencode({
      })
      category = "Deployment"
    }

    template_ref = "template_ref"
    version_label = "version_label"
  }
}

