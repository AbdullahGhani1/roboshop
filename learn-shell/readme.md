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

# RoboShop Project

### Frontend

- Note: serveices install with sudo user - centos user not have access to install packages

Developer has chosen Nginx as a web server and thus we will install Nginx Web Server.

```sh
#!/bin/bash
# install nginx
yum install nginx -y
# enable nginx
systemctl enable nginx
systemctl start nginx
# remove old content
rm -rf /usr/share/nginx/html/*
# download frontend
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
cd /usr/share/nginx/html
# extract frontend
unzip /tmp/frontend.zip

```

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
