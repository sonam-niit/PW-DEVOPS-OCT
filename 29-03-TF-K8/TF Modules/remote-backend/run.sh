terraform init
terraform apply -auto-approve

# Save Bucket name to one variable
BUCKET_NAME=$(terraform output -raw bucket_name)

## Create backend.tf file and add content
cat > backend.tf <<EOF
terraform {
  backend "s3" {
    bucket = "$BUCKET_NAME"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}
EOF

terraform init 
## you have to say yes manually to save state file to bucket.

