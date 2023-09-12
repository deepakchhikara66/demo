resource "harness_platform_service" "service_ref" {
  depends_on = [
    harness_platform_project.terraform_project
  ]
  identifier = "service_ref"
  name = "service_ref"
  org_id = "cvng"
  project_id = harness_platform_project.terraform_project.id
}
