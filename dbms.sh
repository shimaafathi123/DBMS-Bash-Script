#!/bin/bash

# ================================<< Start of (( Directory Variables )) >>================================

# Directory to store databases (same as the script file directory)
SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"
DATABASE_DIR="$SCRIPT_DIR/databases"

# another DATABASE_DIR possible to use (makes databases stored in the user home directory)
# DATABASE_DIR="/home/$(whoami)/Databases/"

# Create the directory if it doesn't exist
mkdir -p "$DATABASE_DIR"

# Variable to track the current database
currentDb=""

# ================================<< End of (( Directory Variables )) >>================================

# ================================<< Start of (( Functions of DBMS )) >>================================

# Function to create a new database
function createDatabase() {
    read -p "Enter the database name: " dbName
    dbPath="$DATABASE_DIR/$dbName"
    if [[ ! $dbName =~ ^[a-zA-Z_][a-zA-Z0-9_]*$ ]]; then
        echo "Invalid database name. Database names must start with a letter or underscore and only contain letters, numbers, and underscores."
    elif [ -d "$dbPath" ]; then
        echo "Database '$dbName' already exists."
    else
        mkdir "$dbPath"
        echo "Database '$dbName' created successfully."
    fi
}

# Function to list all databases
function listDatabase() {
    echo "Available databases:"
    for db in "$DATABASE_DIR"/*/; do
        echo "- $(basename "${db%/}")"
    done
}

# Function to connect to a database
function connectToDatabase() {
    read -p "Enter the database name: " dbName
    dbPath="$DATABASE_DIR/$dbName"
    if [ -d "$dbPath" ]; then
        currentDb="$dbPath"
        echo "Connected to database '$dbName'."
    else
        echo "Database '$dbName' not found."
    fi
}

# Function to drop a database
function dropDatabase() {
    read -p "Enter the database name to drop: " dbName
    dbPath="$DATABASE_DIR/$dbName"
    if [ -d "$dbPath" ]; then
        rm -r "$dbPath"
        echo "Database '$dbName' dropped successfully."
        currentDb=""
    else
        echo "Database '$dbName' not found."
    fi
}

# ================================================================

# Function to create a new table
function createTable() {
    echo "createTable function is called."
}

# Function to list all tables in the current database
function listTable() {
    echo "listTable function is called."
}

# Function to drop a table
function dropTable() {
    echo "dropTable function is called."
}

# Function to insert into a table
function insertIntoTable() {
    echo "insertIntoTable function is called."
}

# Function to select from a table
function selectFromTable() {
    echo "selectFromTable function is called."
}

# Function to delete from a table
function deleteFromTable() {
    echo "deleteFromTable function is called."
}

# Function to update a table
function updateTable() {
    echo "updateTable function is called."
}

# ================================<< End of (( Functions of DBMS )) >>================================

# ================================<< Start of (( Main Menu )) >>================================

while true; do
    PS3="Choose an option: "
    options=("Create Database" "List Databases" "Connect To Database" "Drop Database" "Quit")
    select opt in "${options[@]}"; do
        case $opt in
            "Create Database")
                createDatabase
                break
                ;;
            "List Databases")
                listDatabase
                break
                ;;
            "Connect To Database")
                connectToDatabase
                break
                ;;
            "Drop Database")
                dropDatabase
                break
                ;;
            "Quit")
                echo "Exiting..."
                exit 0
                ;;
            *)
                echo "Invalid option. Please try again."
                ;;
        esac
    done

# ================================<< Start of (( SubMenu )) >>================================

    while [ -n "$currentDb" ]; do
        PS3="Choose an option: "
        options=("Create Table" "List Tables" "Drop Table" "Insert Into Table" "Select From Table" "Delete From Table" "Update Table" "Quit")
        select opt in "${options[@]}"; do
            case $opt in
                "Create Table")
                    createTable
                    break
                    ;;
                "List Tables")
                    listTable
                    break
                    ;;
                "Drop Table")
                    dropTable
                    break
                    ;;
                "Insert Into Table")
                    insertIntoTable
                    break
                    ;;
                "Select From Table")
                    selectFromTable
                    break
                    ;;
                "Delete From Table")
                    deleteFromTable
                    break
                    ;;
                "Update Table")
                    updateTable
                    break
                    ;;
                "Quit")
                    echo "Exiting..."
                    exit 0
                    ;;
                *)
                    echo "Invalid option. Please try again."
                    ;;
            esac
        done
    done

# ================================<< End of (( SubMenu )) >>================================

done

# ================================<< End of (( Main Menu )) >>================================
