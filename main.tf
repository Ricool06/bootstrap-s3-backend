module "bootstrap_backend" {
  source = "./modules/s3_backend"
  project_name = "${var.project_name}"
}

resource "null_resource" "backend_templater" {
  provisioner "local-exec" {
    command =<<EOF
      cd ${dirname(var.path_to_backend_template_file)} && \
      BUCKET=${module.bootstrap_backend.backend_bucket_name} \
      DB_TABLE=${module.bootstrap_backend.backend_table_name} \
      REGION=${module.bootstrap_backend.aws_region} \
      bash -c 'envsubst < ${var.path_to_backend_template_file} > ${dirname(var.path_to_backend_template_file)}/backend.tf'
    EOF
  }
}
