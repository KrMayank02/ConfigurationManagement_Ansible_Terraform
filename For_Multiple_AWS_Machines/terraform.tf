# Declare variable for multi-instances name / Multiple machines

variable "instance_name" {
  type = list(string)
  default = ["tomcat_instance_1","tomcat_instance_2","tomcat_instance_3","tomcat_instance_4","tomcat_instance_5"]
}

# Local values - to be used during resource creation

locals {
  ami_id = "ami-053a45fff0a704a47"
  ssh_user = "ec2-user"
}

# Provider section- AWS

provider "aws" {
  access_key = "AKIA2DZVLKVOJUVAHWXD"
  secret_key = "XXXXXXXXXXXXXXXXXXXXX"
  region = "us-east-1"
}

# Create AWS VPC (Virtual Private Cloud)
resource "aws_vpc" "sl-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "sl-vpc"
  }
}

# Create AWS Subnet
resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.sl-vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch  = true
  depends_on = [aws_vpc.sl-vpc]
  tags = {
    Name = "sl-subnet"
  }
}

# Create AWS Route Table
resource "aws_route_table" "sl-route-table" {
  vpc_id = aws_vpc.sl-vpc.id
  tags = {
    Name = "sl-route-table"
  }
}


# Create AWS Route Table Association
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.sl-route-table.id
}

# Create AWS Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.sl-vpc.id
  depends_on = [aws_vpc.sl-vpc]
  tags = {
    Name = "sl-gw"
 }
}

# Create AWS Route
resource "aws_route" "sl-route" {
  route_table_id = aws_route_table.sl-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id  = aws_internet_gateway.gw.id
}

# AWS security group resource block, 3 inbound and 1 outbound rule added

resource "aws_security_group" "sl-sg" {
  name = "sl-sg"
  vpc_id = aws_vpc.sl-vpc.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sl-sg"
  }
}

# TLS provider

resource "tls_private_key" "tls-key" {
  algorithm = "RSA"
}

# AWS Keypair with TLS

resource "aws_key_pair" "app-key" {
  key_name   = "sl-key"
  public_key = tls_private_key.tls-key.public_key_openssh
}

# Saving the key in a file

resource "local_file" "sl-key" {
  content  = tls_private_key.tls-key.private_key_pem
  filename = "sl-key.pem"
  file_permission = "0400"
}

# AWS EC2 instance resource block

resource "aws_instance" "web" {
  count = 5  
  ami = local.ami_id
  instance_type = "t2.micro"
  associate_public_ip_address = true

  subnet_id = aws_subnet.subnet-1.id
  security_groups = [aws_security_group.sl-sg.id]
  
  key_name = aws_key_pair.app-key.key_name

  tags = {
    Name = var.instance_name[count.index]
  }

  # SSH Connection block to be used by the provisioners - remote-exec
  
  connection {
    type = "ssh"
    host = self.public_ip
    user = local.ssh_user
    private_key = file("${local_file.sl-key.filename}")
    timeout = "3m"
   }

  # Remote-exec Provisioner Block, on SSH connection

  provisioner "remote-exec" {
    inline = [
      "echo 'wait for SSH connection to be ready...'",
      "touch /home/ec2-user/demo-file-from-terraform.txt",
      "sudo yum update -y"
    ]
  }

  # Local-exec Provisioner Block - create an Ansible Dynamic Custom Inventory
  
  provisioner "local-exec" {
       command = "echo ${self.public_ip} >> myhosts"
  }

}

 # Create Null Resource Block, to execute Ansible Playbook post resource provisioning

  resource "null_resource" "execute_playbook" {

    triggers = {

    instance_ids = join(",", aws_instance.web[*].id)
  }
  
  # Run Ansible Playbook

  provisioner "local-exec" {

    command = "ansible-playbook -i myhosts --private-key sl-key.pem tomcat-playbook.yaml -f 1"
  }
}

# Output block to print the public-ip of instances

output "instance_ip" {
  value = aws_instance.web[*].public_ip
}

