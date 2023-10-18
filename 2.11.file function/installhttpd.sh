#!/bin/bash
sudo yum install httpd -y
cd /var/www/html
echo "<html><h1>Welcome to greens...!!</h1></html>" > index.html
sudo systemctl enable httpd
sudo systemctl start httpd
