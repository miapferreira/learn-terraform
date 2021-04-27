provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    # Lembre de trocar o bucket para o seu, não pode ser o mesmo nome
    bucket  = "estudos-terraform"
    key     = "michel.tfstate"
    region  = "us-east-1"
    encrypt = true #inserindo criptografia no backend (s3)
  }
}