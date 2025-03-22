provider "local" {}

resource "local_file" "sample" {
  filename = "hello.txt"
  content = "Welcome to Terraform!! Infrastructure as Code"
}

# -- terraform init
# -- terraform Plan
# -- terraform apply
# (check the cretaed file)
# -- terraform destroy
# (files will get deleted)