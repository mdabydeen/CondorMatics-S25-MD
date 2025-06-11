#! /bin/bash

sudo amazon-linux-extras install -y nginx1
sudo service nginx start

# aws s3 cp -r s3://${aws_s3_bucket.web_bucket.id}/webcontent/  /home/ec2-user/
# aws s3 sync  s3://${aws_s3_bucket.web_bucket.id}/webcontent/  /home/ec2-user/

aws s3 cp s3://${aws_s3_bucket.web_bucket.id}/webcontent/index.html  /home/ec2-user/index.html
aws s3 cp s3://${aws_s3_bucket.web_bucket.id}/webcontent/style.css  /home/ec2-user/styles.css
aws s3 cp s3://${aws_s3_bucket.web_bucket.id}/webcontent/campus.jpg  /home/ec2-user/campus.jpg
aws s3 cp s3://${aws_s3_bucket.web_bucket.id}/webcontent/students.jpg  /home/ec2-user/students.jpg
aws s3 cp s3://${aws_s3_bucket.web_bucket.id}/webcontent/programs.jpg  /home/ec2-user/programs.jpg

sudo rm /usr/share/nginx/html/index.html

sudo cp /home/ec2-user/index.html  /usr/share/nginx/html/index.html
sudo cp /home/ec2-user/styles.css  /usr/share/nginx/html/styles.css
sudo cp /home/ec2-user/campus.jpg  /usr/share/nginx/html/campus.jpg
sudo cp /home/ec2-user/students.jpg  /usr/share/nginx/html/students.jpg
sudo cp /home/ec2-user/programs.jpg  /usr/share/nginx/html/programs.jpg

