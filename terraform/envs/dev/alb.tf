resource "aws_lb" "app" {
  name               = "ha-webapp-alb"
  load_balancer_type = "application"
  internal           = false

  security_groups = [aws_security_group.alb_sg.id]
  subnets         = aws_subnet.public[*].id

  tags = merge(local.common_tags, {
    Name = "ha-webapp-alb"
    Role = "load-balancer"
  })
}

resource "aws_lb_target_group" "app" {
  name     = "ha-webapp-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = merge(local.common_tags, {
    Name = "ha-webapp-tg"
    Role = "target-group"
  })
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app.arn
  }
}