resource "harness_platform_environment" "environment_ref" {
	depends_on = [
		harness_platform_project.terraform_project
	]
	identifier = "environment_ref"
	name = "environment_ref"
	org_id = "cvng"
	project_id = "ecommerce"
	tags = ["foo:bar", "baz"]
	type = "PreProduction"
}
