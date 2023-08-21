#!/bin/bash
# install nginx
yum install nginx -y
cp nginx-roboshop.conf /etc/nginx/default.d/roboshop.conf

# remove old content
rm -rf /usr/share/nginx/html/*
# download frontend
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
cd /usr/share/nginx/html
# extract frontend
unzip /tmp/frontend.zip



# enable nginx
systemctl enable nginx
systemctl restart nginx
