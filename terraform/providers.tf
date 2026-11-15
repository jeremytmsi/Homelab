terraform {
  required_providers {
    xenorchestra = {
      source = "vatesfr/xenorchestra"
      version = ">= 0.35.0, < 1.0.0"
    }
  }
}

provider "xenorchestra" {
  url = var.xo_host
  token = var.xo_token

  insecure = true
}
