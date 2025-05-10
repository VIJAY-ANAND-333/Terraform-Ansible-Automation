resource "aws_instance" "web" {
  ami                    = ""
  instance_type          = "t2.micro"
  key_name               = ""
  vpc_security_group_ids = [""]
  availability_zone      = "us-east-1a"

  root_block_device {
    volume_size = 8
    volume_type = "gp2"
  }

  user_data = <<-EOF
      #!/bin/bash
      sudo apt update -y
      sudo apt install -y python3 python3-pip
      sleep 30  # Ensuring Python installation before Ansible execution
    EOF

  tags = {
    Name    = ""
    Billing = ""
  }
}

resource "aws_ebs_volume" "ebs" {
  availability_zone = aws_instance.web.availability_zone
  size              = 8
  encrypted         = true

  tags = {
    Name = "new_EBS"
  }
}

resource "aws_volume_attachment" "ebs_attachment" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs.id
  instance_id = aws_instance.web.id
}

resource "null_resource" "update_inventory" {
  depends_on = [aws_instance.web]

  provisioner "local-exec" {
    command = <<EOT
      echo "${aws_instance.web.public_ip}" > ../ansible/hosts.ini
    EOT
  }
}


resource "null_resource" "ansible_nginx" {
  depends_on = [aws_instance.web, null_resource.update_inventory]

  provisioner "local-exec" {
    command = <<EOT
      sleep 100
      ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ../ansible/hosts.ini -u ubuntu \
      --private-key ${var.key_path} ../ansible/nginx-certbot-playbook.yml
    EOT
  }
}

resource "null_resource" "ansible_docker" {
  depends_on = [aws_instance.web, null_resource.update_inventory]

  provisioner "local-exec" {
    command = <<EOT
      sleep 100
      ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ../ansible/hosts.ini -u ubuntu \
      --private-key ${var.key_path} ../ansible/docker-playbook.yml
    EOT
  }
}

