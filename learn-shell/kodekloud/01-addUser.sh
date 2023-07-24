#!/bin/bash
# Default server details
default_server_ip="172.16.238.10"
default_server_user="tony"
default_server_password="Ir0nM@n"

# Check if command-line arguments are provided, otherwise use default values
if [ $# -eq 5 ]; then
    server_ip="$1"
    server_user="$2"
    server_password="$3"
    username="$4"
    userid="$5"
else
    server_ip="$default_server_ip"
    server_user="$default_server_user"
    server_password="$default_server_password"
    username="kareem"
    userid=1653
fi

# Function to check if the user exists on the remote server
user_exists() {
    echo "$server_password" | sshpass -p "$server_password" ssh -o StrictHostKeyChecking=no "$server_user@$server_ip" "id $username > /dev/null 2>&1"
    return $?
}

# Function to execute commands on the remote server via SSH using sshpass and sudo -S
execute_remote_commands() {
    if user_exists; then
        echo "User '$username' already exists. Removing the user..."
        echo "$server_password" | sshpass -p "$server_password" ssh -o StrictHostKeyChecking=no "$server_user@$server_ip" "echo \"$server_password\" | sudo -S userdel -r $username"
    fi

    echo "Creating user '$username'..."
    local user_creation_output=$(echo "$server_password" | sshpass -p "$server_password" ssh -o StrictHostKeyChecking=no "$server_user@$server_ip" "
        echo \"$server_password\" | sudo -S useradd -u $userid -d /var/www/$username -m $username 2>&1
        echo ~$username
        cut -d: -f1 /etc/passwd | sort | uniq
    ")

    # Check if the user was created successfully
    if [[ $user_creation_output == *"useradd: invalid user ID"* ]]; then
        echo "Failed to create user '$username'."
    else
        echo "User '$username' was created successfully."
        echo "============"
        echo "ServerName\t $server_user"
        echo "IP\t   $server_ip"
        echo "Hostname\t       stapp01.stratos.xfusioncorp.com"
        echo "User $server_user\t"
        echo "Password\t\t$server_password"
        echo "---------------------"
    fi
}


# Run the function to execute commands on the remote server
execute_remote_commands
