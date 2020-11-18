provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    # Lembre de trocar o bucket para o seu, não pode ser o mesmo nome
    bucket = "nome do bucket"
    key    = "nome do arquivo.tfstate"
    region = "us-east-1"
  }
}