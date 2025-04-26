#!/bin/bash

# Check for required arguments
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <create_users> <settings1> <settings2> ..."
    exit 1
fi

CREATE_USERS=$1

# Prompt for user passwords
declare -A USER_PASSWORDS
USERS=("CONSUMER_DB" "CONSUMER_QUEUE" "CONSUMER_STORAGE" "INSERT_MODEL_DB" "INSERT_MODEL_STORAGE" "ENQUEUE_REPORT_DB" "ENQUEUE_REPORT_QUEUE" "ENQUEUE_REPORT_STORAGE" "API_DB" "API_QUEUE" "API_STORAGE")

for USER in "${USERS[@]}"; do
    read -sp "Enter password for $USER: " PASSWORD
    echo
    USER_PASSWORDS[$USER]=$PASSWORD
done

# Replace placeholders in the files
for SETTINGS in "$@"; do
    for USER in "${USERS[@]}"; do
        sed -i "s/${USER}_PASSWORD/${USER_PASSWORDS[$USER]}/g" $SETTINGS
    done
done

# Prompt for MySQL connection details
read -p "Enter MySQL host: " MYSQL_HOST
read -p "Enter MySQL port: " MYSQL_PORT
read -sp "Enter MySQL root password: " MYSQL_ROOT_PASSWORD
echo

# Install mysql-client if not installed
if ! command -v mysql &> /dev/null; then
    echo "mysql-client not found, installing..."
    sudo apt-get update
    sudo apt-get install -y mysql-client
fi

# Execute the SQL script
mysql -h $MYSQL_HOST -P $MYSQL_PORT -u root -p$MYSQL_ROOT_PASSWORD < $CREATE_USERS

# Check for successful execution
if [ $? -eq 0 ]; then
    echo "SQL script executed successfully."
else
    echo "Failed to execute SQL script."
fi
