resource "aws_instance" "WEB" {
  ami                         = var.ami
  count                       = 1
  instance_type               = var.instance_type
  key_name                    = "${var.key_pair}"
  #availability_zone           = var.availability_zone
  #vpc_security_group          = "${aws_security_group.allow_ssh.id}" #Verificar como declara o security group
  associate_public_ip_address = true

  provisioner "remote-exec" {
    inline = [
      "touch /tmp/test",
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      host        = "${self.public_ip}"
      private_key = "${file("linux.pem")}"
    }

  }

  root_block_device { # Definir um tamanho padrão de disco
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