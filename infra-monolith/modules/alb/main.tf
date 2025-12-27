resource "aws_lb" "app" {
  name               = "${var.name}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets            = var.subnet_ids
}

resource "aws_lb_target_group" "web" {
  name     = "${var.name}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "web" {
  load_balancer_arn = aws_lb.app.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web.arn
  }
}

resource "aws_lb_target_group_attachment" "ec2" {
  count = length(var.instance_ids)

  target_group_arn = aws_lb_target_group.web.arn
  target_id        = var.instance_ids[count.index]
  port             = 80
}
