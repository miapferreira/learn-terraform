resource "aws_instance" "teste" {
  ami                         = var.ami
  instance_type               = var.instance_type
  availability_zone           = var.availability_zone
  associate_public_ip_address = true


  root_block_device { #Tamanho padrão de disco
    volume_size = "${var.disk_size}"
    volume_type = "${var.volume_type}"
  }

  tags = {
    Name  = "Teste"
    OWNER = "MichelFerreira"
  }

  lifecycle {
    create_before_destroy = true
  }
}