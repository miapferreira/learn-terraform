resource "aws_instance" "WEB" {
  ami = data.aws_ami.ubuntu.id
  #count                       = var.environment == "production" ? 3 : 1 #Inserindo condição para ambiente de produção
  #count         = var.production ? 2 : 1
  #instance_type = count.index < 1 ? "t2.micro" : "t3.medium"
  key_name      = var.key_pair
  instance_type               = var.instance_type
  associate_public_ip_address = true

  root_block_device { # Definir um tamanho padrão de disco
    volume_size = var.disk_size
    volume_type = var.volume_type
  }

  tags = var.tags

  lifecycle {
    create_before_destroy = true
  }
}