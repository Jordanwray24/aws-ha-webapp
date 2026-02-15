data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_launch_template" "app" {
  name_prefix   = "ha-webapp-lt-"
  image_id      = data.aws_ami.al2023.id
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    dnf update -y
    dnf install -y nginx
    systemctl enable nginx
    systemctl start nginx

    HOSTNAME=$(hostname)
    cat > /usr/share/nginx/html/index.html <<HTML
<html>
  <head><title>HA WebApp</title></head>
  <body>
    <h1>HA WebApp is running!</h1>
    <p><b>Instance:</b> $${HOSTNAME}</p>
    <p><b>Env:</b> dev</p>
    <p><b>Deployed:</b> $(date)</p>
  </body>
</html>
HTML
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "ha-webapp-instance"
    }
  }
}