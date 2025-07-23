#! /bin/bash

sudo amazon-linux-extras install -y nginx1
sudo service nginx start

aws s3 sync s3://${s3_bucket_id}/webcontent/  /home/ec2-user/

sudo rm /usr/share/nginx/html/index.html
sudo cp -r /home/ec2-user/ /usr/share/nginx/html/

sudo service nginx restart