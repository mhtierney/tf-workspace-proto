locals {

  env = {

    default = {
      project_name = "project_default"
      region_name = "region-default"
      username = "some-app-username"
      password = "default-password"
    }

    mht = {
      project_name = "project-mht"
      region_name = "region-mht"
      password = "password-for-mht"
    }

    dev = {
      project_name = "project-dev"
      region_name = "region-dev"
      password = "password-for-dev"
    }

    qa = {
      project_name = "project-qa"
      region_name = "region-qa"
      password = "password-for-qa"
    }

    prod = {
      project_name = "project-prod"
      region_name = "region-prod"
      password = "password-for-prod"
    }

  }

  workspace = merge(local.env["default"], local.env[lower(terraform.workspace)])
}

#Validate that a valid workspace has been selected.  TF doesnt currently support raise error, so just using file function to force error
locals {
  assert_is_valid_workspace = contains(keys(local.env), terraform.workspace) ? true : file("ERROR: Invalid workspace selected. Please select a valid terraform workspace.")
}


