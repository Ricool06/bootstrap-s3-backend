module "bootstrap_example" {
  source = "../"
  project_name = "some-example"
  path_to_backend_template_file = "./backend.tf.tmpl"
}
