#!/bin/bash

# Variables
TEMPLATE_DIR="templates"
LOG_DIR="logs"
PHP_SERVER_PORT=8080

# Function to display the menu
display_menu() {
    echo "MyPhisher - Simple Phishing Tool"
    echo "1. Start Phishing"
    echo "2. Stop Phishing"
    echo "3. Exit"
}

# Function to start the phishing server
start_phishing() {
    echo "Starting PHP server on port $PHP_SERVER_PORT..."
    php -S localhost:$PHP_SERVER_PORT -t $TEMPLATE_DIR > $LOG_DIR/server.log 2>&1 &
    echo "PHP server started. Access it at http://localhost:$PHP_SERVER_PORT"
}

# Function to stop the phishing server
stop_phishing() {
    echo "Stopping PHP server..."
    pkill -f "php -S localhost:$PHP_SERVER_PORT"
    echo "PHP server stopped."
}

# Main menu loop
while true; do
    display_menu
    read -p "Choose an option: " choice
    case $choice in
        1)
            start_phishing
            ;;
        2)
            stop_phishing
            ;;
        3)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done