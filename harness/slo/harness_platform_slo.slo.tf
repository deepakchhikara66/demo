resource "harness_platform_slo" "slo" {
  depends_on = [
    harness_platform_monitored_service.service_ref_environment_ref,
  ]
  org_id     = "cvng"
  project_id = harness_platform_project.terraform_project.id
  identifier = "slo"
  request {
    name              = "slo"
    description       = "description"
    tags              = ["foo:bar", "bar:foo"]
    user_journey_refs = ["one", "two"]
    slo_target {
      type                  = "Calender"
      slo_target_percentage = 93
      spec                  = jsonencode({
        type = "Monthly"
        spec = {
          dayOfMonth = 6
        }
      })
    }
    type = "Simple"
    spec = jsonencode({
      monitoredServiceRef       = harness_platform_monitored_service.service_ref_environment_ref.id
      healthSourceRef           = "prometheus"
      serviceLevelIndicatorType = "Availability"
      serviceLevelIndicators    = [
        {
          name       = "name"
          identifier = "slo"
          type       = "Availability"
          spec       = {
            type = "Threshold"
            spec = {
              metric1        = "prometheus_metric"
              thresholdValue = 30
              thresholdType  = ">"
            }
          }
          sliMissingDataType = "Good"
        }
      ]
    })
  }
}
