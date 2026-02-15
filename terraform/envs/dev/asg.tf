resource "aws_autoscaling_group" "app" {
  name                = "ha-webapp-asg"
  desired_capacity    = 2
  max_size            = 2
  min_size            = 2
  vpc_zone_identifier = [aws_subnet.private[0].id, aws_subnet.private[1].id]

  health_check_type         = "ELB"
  health_check_grace_period = 120

  target_group_arns = [aws_lb_target_group.app.arn]

  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "ha-webapp-asg-instance"
    propagate_at_launch = true
  }
}