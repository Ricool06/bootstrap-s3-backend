# bootstrap-s3-backend
Terraform module to bootstrap an S3 + DynamoDB backend in Terraform, with templating of backend file.

## How-to
Create a file in the same directory where `backend.tf` will be with the contents:
```
terraform {
  backend "s3" {
    bucket         = "${BUCKET}"
    key            = "terraform.tfstate"
    region         = "${REGION}"
    dynamodb_table = "${DB_TABLE}"
  }
}
```

Then call this module however you like, setting the variables:
- path_to_backend_template_file
- project_name

## Example usage
```
module "bootstrap_example" {
  source = "github.com/Ricool06/bootstrap-s3-backend"
  project_name = "some-example"
  path_to_backend_template_file = "./backend.tf.tmpl"
}
```