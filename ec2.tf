resource "aws_instance" "WEB" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  # key_name      = var.key_pair
  associate_public_ip_address = true

  root_block_device { # Definir um tamanho padrão de disco
    volume_size = var.disk_size
    volume_type = var.volume_type
  }

  tags = {
    Name  = "Teste"
    OWNER = "Michel"
  }

  lifecycle {
    create_before_destroy = true
  }
}