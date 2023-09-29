resource "harness_platform_environment" "environment_ref" {
	identifier = "environment_ref"
	name = "environment_ref"
	org_id = "cvng"
	project_id = "ecommerce"
	tags = ["foo:bar", "baz"]
	type = "PreProduction"
}
