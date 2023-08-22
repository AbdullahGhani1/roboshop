cp ./mongo.repo  /etc/yum.repos.d/mongo.repo
# install MongoDB
yum install mongodb-org -y
# Update Listen address from 127.0.0.1 to 0.0.0.0


# Start & Enable MongoDB Service
systemctl enable mongod
systemctl restart mongod

