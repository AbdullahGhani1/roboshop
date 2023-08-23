yum install golang -y
cp payment.service /etc/systemd/system/payment.service

useradd roboshop

mkdir /app

curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip
cd /app
unzip /tmp/dispatch.zip

cd /app
go mod init dispatch
go get
go build

# Load the service.
systemctl daemon-reload
# Start the service.
systemctl enable dispatch
systemctl start dispatch
