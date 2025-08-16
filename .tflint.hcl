plugin "terraform" {
  enabled = true
}

plugin "ibm" {
  enabled = true
  source  = "github.com/IBM-Cloud/terraform-tflint-ruleset"
  version = "0.6.0"
}

config {
  module = true
}
