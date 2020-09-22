provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    # Lembre de trocar o bucket para o seu, não pode ser o mesmo nome
    bucket = "curso-udemy-tfstate"
    key    = "cursoudemy.tfstate"
    region = "us-east-1"
  }
}