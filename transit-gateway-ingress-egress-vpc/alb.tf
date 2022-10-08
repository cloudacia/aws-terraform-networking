#################################################
# APPLICATION LOAD BALANCER                     #
#################################################
resource "aws_lb" "vpc_ingress_alb01" {
  name                       = "alb01"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.alb.id]
  subnets                    = [aws_subnet.vpc_ingress_subnet01.id, aws_subnet.vpc_ingress_subnet02.id]
  enable_deletion_protection = false
}

#################################################
# APPLICATION LOAD BALANCER LISTENER TCP/HTTP   #
#################################################
resource "aws_alb_listener" "alb_listener_front_end" {
  load_balancer_arn = aws_lb.vpc_ingress_alb01.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.vpc_ingress_alb_tg.arn
  }
}

#################################################
# APPLICATION LOAD TARGET GROUP                 #
#################################################
resource "aws_alb_target_group" "vpc_ingress_alb_tg" {
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc_ingress.id
  target_type = "ip"

  health_check {
    protocol            = "HTTP"
    path                = "/"
    port                = "traffic-port"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    matcher             = "200"
  }
}

################################################
#  ATTACH EC2 INSTANCES TO ALB                 #
################################################
resource "aws_lb_target_group_attachment" "web01" {
  target_group_arn  = aws_alb_target_group.vpc_ingress_alb_tg.arn
  target_id         = var.ec2_instance_private_ip_1
  port              = 80
  availability_zone = "all"

  depends_on = [aws_instance.web01]
}

################################################
#  ATTACH EC2 INSTANCES TO ALB                 #
################################################
resource "aws_lb_target_group_attachment" "web02" {
  target_group_arn  = aws_alb_target_group.vpc_ingress_alb_tg.arn
  target_id         = var.ec2_instance_private_ip_2
  port              = 80
  availability_zone = "all"

  depends_on = [aws_instance.web02]
}
