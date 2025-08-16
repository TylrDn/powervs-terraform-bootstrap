# Intentionally invalid: network_ids is empty
module "instance" {
  source = "../../modules/powervs-instance"

  service_instance_id = "dummy"
  instance_name       = "test"
  processors          = 1
  memory_mb           = 1024
  ssh_key_name        = "key"
  image_name          = "img"
  network_ids         = []
}
