### Providing Values to Input Variables

**1. Default values** (in variables.tf)
```hcl
variable "environment" {
  default = "staging"
}
```

**2. terraform.tfvars file** (auto-loaded)
```hcl
environment = "demo"
bucket_name = "terraform-demo-bucket"
```

**3. Command line**
```bash
terraform plan -var="environment=production"
```

**4. Environment variables**
```bash
export TF_VAR_environment="development"
terraform plan
```