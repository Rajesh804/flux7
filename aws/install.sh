#!/bin/sh
yum install -y httpd
service httpd restart
chkconfig httpd on
echo "<html><h1>Hello from Rajesh Reddy ^^</h2></html>" > /var/www/html/index.html
