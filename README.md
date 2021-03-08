# tf-workspace-proto

This is a demo of how to set environment dependent variable values in Terraform at runtime via the Terrform workspace feature.  Variable values are set at runtime depending on what workspace is selected.  This allows the same core TF code to be reused across all environments.
Any environment specific values are set via the terraform workspace (see env.tf) and applied at runtime.

The env.tf file contains the "default" values and any env specific values/overrides.

Environment dependent/workspace variables are referenced in the Terraform code via......
```terraform
local.workspace["{var_name}"]  
```

For example....
```terraform
value = local.workspace["password"]
```

This demo does not actually apply anything to any aws env.  It only outputs values based, so it is safe to run apply as it is not connected to any aws account. 

Follow these steps to see how it works.  The ouput values from running tf apply are determined by whichever workspace is selected.

```
>   terraform workspace new dev
>   terraform apply
>   terraform workspace new {mht|dev|qa|prod}
>   terraform apply
>   terraform workspace select {mht|dev|qa|prod}
>   terraform apply
>   terraform workspace list
>   terraform workspace show
```