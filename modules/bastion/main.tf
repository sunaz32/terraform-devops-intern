resource "aws_instance" "bastion" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = [var.bastion_sg_id]

  tags = {
    Name = "${var.app_name}-bastion"
  }
}
