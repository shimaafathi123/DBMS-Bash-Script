#!/bin/bash

# Directory to store databases

DATABASE_DIR="/home/$(whoami)/Databases/"

if [ ! -d "$DATABASE_DIR" ]; then
    mkdir -p "$DATABASE_DIR"
    echo "Directory $DATABASE_DIR created for Databases."
fi

# ###############################################################################################

# Functions of the DBMS

createDatabase() {
    echo "createDatabase function is called."
}

listDatabases() {
    echo "listDatabases function is called."
}

connectToDatabase() {
    echo "connectToDatabase function is called."
}

dropDatabase() {
    echo "dropDatabase function is called."
}

createTable() {
    echo "createTable function is called."
}

listTables() {
    echo "listTables function is called."
}

dropTable() {
    echo "dropTable function is called."
}

insertIntoTable() {
    echo "insertIntoTable function is called."
}

selectFromTable() {
    echo "selectFromTable function is called."
}

deleteFromTable() {
    echo "deleteFromTable function is called."
}

updateTable() {
    echo "updateTable function is called."
}

# ###############################################################################################

# Main Menu
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
                listDatabases
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

# ###############################################################################################

    # Submenu for connected database
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
                    listTables
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
done
