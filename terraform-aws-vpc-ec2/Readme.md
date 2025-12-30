```
terraform-aws-vpc-ec2/
.
├── ec2.tf
├── output.tf
├── provider.tf
├── Readme.md
├── route-table.tf
├── security-group.tf
├── subnet.tf
├── terraform.tfstate
├── terraform.tfstate.backup
├── variables.tf
└── vpc.tf
```

```
  terraform init
   terraform fmt
   terraform validate
   terraform plan
   terraform validate
   terraform init
   terraform plan
   terraform apply
   terraform plan
   terraform destroy

   terraform destroy -target=aws_instance.public_ec2_two
   terraform destroy 

 ```