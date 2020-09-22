resource "aws_ebs_volume" "criando-disco" { #Cria um volume novo
  availability_zone = "${var.availability_zone}"
  size              = 20

  tags = {
    Name = "michel"
  }
}

resource "aws_volume_attachment" "criando-disco" { #Atacha o volume criado no EC2
  device_name = "/dev/sdf"
  volume_id   = "${aws_ebs_volume.criando-disco.id}"
  instance_id = "${aws_instance.portal.id}"
}
