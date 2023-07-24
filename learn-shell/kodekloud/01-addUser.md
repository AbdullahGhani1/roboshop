### For security reasons the xFusionCorp Industries security team has decided to use custom Apache users for each web application hosted, rather than its default user. This will be the Apache user, so it shouldn't use the default home directory. Create the user as per requirements given below:

### a. Create a user named john on the App server 3 in Stratos Datacenter.

### b. Set its UID to 1189 and home directory to /var/www/john.

```sh
sudo useradd -u 1894 -d /var/www/john -m  john
echo ~john
cut -d: -f1 /etc/passwd | sort | uniq
```
