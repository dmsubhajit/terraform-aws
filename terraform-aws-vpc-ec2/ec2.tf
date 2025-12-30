resource "aws_key_pair" "dev-key" {
  key_name   = "deployer-key"
  public_key = file("/home/subhajit-das/.ssh/id_ed25519.pub")
}

data "aws_ami" "amazon-linux" {
  most_recent = true
  owners = ["amazon"] # Amazon

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name = "free-tier-eligible"
    values = ["true"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  
}

resource "aws_instance" "public_ec2" {
  ami                    = data.aws_ami.amazon-linux.id
  instance_type          = var.ec2_instance_type
  key_name               = aws_key_pair.dev-key.key_name
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]


  tags = {
    Name = "public-ec2-instance"
  }
}

resource "aws_instance" "public_ec2_two" {
  ami                    = data.aws_ami.amazon-linux.id
  instance_type          = var.ec2_instance_type
  key_name               = aws_key_pair.dev-key.key_name
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]


  tags = {
    Name = "public-ec2-instance-two"
  }
}

resource "aws_instance" "private_ec2" {
  ami                    = data.aws_ami.amazon-linux.id
  instance_type          = var.ec2_instance_type
  key_name               = aws_key_pair.dev-key.key_name
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]


  tags = {
    Name = "private-ec2-instance"
  }
}