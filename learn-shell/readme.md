# Learn Shell

Shell Scripting, we learn Bash Shell Scripting

List of Topics:

1. Comments
2. Print
3. Variables
4. Functions
5. Conditions
6. Loops
7. Exit Status & Redirectors & Quotes
8. SED Editor

---

# RoboShop Project Shell Script

#### Functional and non-functional requirements

Thet are aspects of software development that define what a system or application should do and how it should perform. While these concepts are typically associated with software development, they are not directly related to Bash scripting, which is used for writing scripts and automation tasks in the Unix-like shell environment.

However, you can certainly incorporate functional and non-functional requirements into your Bash scripts by ensuring that your scripts fulfill the desired functionality and meet performance expectations. Here's how you might approach this:

##### Functional Requirements in Bash Scripting:

Functional requirements describe what the software should do and what features it should have. In the context of a Bash script, this could involve automating certain tasks, processing data, or performing specific actions.

For example, if you were tasked with creating a Bash script that backs up a directory, your functional requirements might include:

- The script should create a compressed archive of the specified directory.
- The script should include a timestamp in the archive filename.
- The script should store the archive in a designated backup directory.

#### Non-Functional Requirements in Bash Scripting:

Non-functional requirements focus on how well the software performs its functions. In the context of a Bash script, these requirements might encompass factors like performance, reliability, security, and usability.

Continuing with the backup script example, some non-functional requirements could be:

1. **Performance:** The script should efficiently compress the archive to minimize processing time.
2. **Reliability:** The script should handle errors gracefully and provide informative error messages.
3. **Security:** The script should ensure that sensitive data is not exposed and follows best practices for file permissions.
4. **Usability:** The script should have clear and informative usage instructions when invoked with incorrect parameters.
   Keep in mind that while these concepts can be applied to Bash scripting, they are often more directly associated with traditional software development. If you're working on a larger project that involves both script development and software development, you may need to document and manage your functional and non-functional requirements separately, based on the scope and nature of the project.

#### Rout 53

![Alt Text](./assets/images/route53.jpg)

- create record
  ![Alt Text](./assets/images/createRecord.jpg)

### 01. Frontend

- Note: serveices install with sudo user - centos user not have access to install packages

Developer has chosen Nginx as a web server and thus we will install Nginx Web Server.

- create a file name nginx-roboshop.conf

```conf
proxy_http_version 1.1;
location /images/ {
  expires 5s;
  root   /usr/share/nginx/html;
  try_files $uri /images/placeholder.jpg;
}
location /api/catalogue/ { proxy_pass http://localhost:8080/; }
location /api/user/ { proxy_pass http://localhost:8080/; }
location /api/cart/ { proxy_pass http://localhost:8080/; }
location /api/shipping/ { proxy_pass http://localhost:8080/; }
location /api/payment/ { proxy_pass http://localhost:8080/; }

location /health {
  stub_status on;
  access_log off;
}

```

- create a frontend.sh bash script

```sh
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

```

### 02. MongoDB

Developer has chosen the database MongoDB. Hence, we are trying to install it up and configure it.

<div style="background-color: #d8f5e1; padding: 10px; border-radius: 5px;">
<span style="display:inline-block;margin-right: 0.4em;vertical-align: middle;">
  <svg style="display:inline-block;height:1.6em;width:1.6em;" viewBox="0 0 12 16"><path fill-rule="evenodd" d="M6.5 0C3.48 0 1 2.19 1 5c0 .92.55 2.25 1 3 1.34 2.25 1.78 2.78 2 4v1h5v-1c.22-1.22.66-1.75 2-4 .45-.75 1-2.08 1-3 0-2.81-2.48-5-5.5-5zm3.64 7.48c-.25.44-.47.8-.67 1.11-.86 1.41-1.25 2.06-1.45 3.23-.02.05-.02.11-.02.17H5c0-.06 0-.13-.02-.17-.2-1.17-.59-1.83-1.45-3.23-.2-.31-.42-.67-.67-1.11C2.44 6.78 2 5.65 2 5c0-2.2 2.02-4 4.5-4 1.22 0 2.36.42 3.22 1.19C10.55 2.94 11 3.94 11 5c0 .66-.44 1.78-.86 2.48zM4 14h5c-.23 1.14-1.3 2-2.5 2s-2.27-.86-2.5-2z"></path></svg>
  Hint
  </span>
  <br>
  Versions of the DB Software you will get context from the developer. Meaning we need to check with the developer. Developer has shared the version information as MongoDB-4.x.
</div>
<br>

- Setup the MongoDB repo file name: mongo.repo

```file
[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.2/x86_64/
gpgcheck=0
enabled=1
```

- Install MongoDB

```sh
yum install mongodb-org -y

```

- Start & Enable MongoDB Service

```sh
systemctl enable mongod
systemctl start mongod
```

Usually MongoDB opens the port only to localhost(127.0.0.1), meaning this service can be accessed by the application that is hosted on this server only. However, we need to access this service to be accessed by another server, So we need to change the config accordingly.

- Update listen address from 127.0.0.1 to 0.0.0.0 in /etc/mongod.conf

- Restart the service to make the changes effected.

```sh
systemctl restart mongod
```
