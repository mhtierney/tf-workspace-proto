terraform {
  required_version = ">= 0.12.26"
}

output "description" {
  value = "This is a demo of how to set environment dependent variable values in Terraform at runtime via the Terrform workspace feature.  Variable values are set at runtime depending on what workspace is selected.  All of the following output values are determined by whichever workspace you select......"
}

output "webapp_input_directory" {
  value = "some-inputdir-${terraform.workspace}"
}

output "webapp_workspace" {
  value = terraform.workspace
}

output "webapp_supported_workspaces" {
  value = join(", ", keys(local.env))
}


output "webapp_project_name" {
  value = local.workspace["project_name"]
}

output "webapp_region_name" {
  value = local.workspace["region_name"]
}

output "webapp_username" {
  value = local.workspace["username"]
}

output "webapp_password" {
  value = local.workspace["password"]
}