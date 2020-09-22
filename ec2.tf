data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "portal" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_pair}"
  availability_zone           = "${var.availability_zone}"
  associate_public_ip_address = true

  root_block_device {                                          #Tamanho padrão de disco
    volume_size = "${var.disk_size}"
    volume_type = "${var.volume_type}"
  }

  tags = {
    Name = "PORTAL REVENDA"
  }

  lifecycle {
    create_before_destroy = true
  }
}