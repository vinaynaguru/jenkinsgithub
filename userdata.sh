#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
echo "<h1>Welcome to My Web Server - Terraform & Jenkins</h1>" | sudo tee /var/www/html/index.html
sudo systemctl enable apache2
sudo systemctl start apache2
