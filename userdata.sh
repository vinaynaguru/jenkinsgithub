#!/bin/bash
sudo apt update -y
sudo apt install -y apache2
echo "<h1>Welcome to My Web Server - Terraform & Jenkins</h1>" | sudo tee /var/www/html/index.html
sudo systemctl enable --now apache2
