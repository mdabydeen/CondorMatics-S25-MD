resource "aws_cloudwatch_dashboard" "condormatics-dashboard" {
  dashboard_name = "condormatics-dashboard"
  dashboard_body = jsonencode({
    widget = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6

        properties = {
          metrics = [
            "AWS/EC2",
            "CPUUtilization",
            "InstanceId",
            "${aws_instance.nginx1.id}"
          ]
          period = 100
          stat   = "Average"
          region = "us-east-1"
          title  = "${aws_instance.nginx1.id} - CPU Utilization"
        }
      }
    ]
  })
}

resource "aws_cloudwatch_metric_alarm" "ec2-nginx1-cpu-alarm" {
  alarm_name                = "condormatics-ec2-nginx1-cpu-alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 120
  statistic                 = "Average"
  threshold                 = 80
  alarm_description         = "This metric monitors EC2 CPU Utilization above 80%"
  insufficient_data_actions = []
}