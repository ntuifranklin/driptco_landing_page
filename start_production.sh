#!/bin/bash
# This scripts starts the rails app  production server
# It is owned by root

echo "Disabling httpd service"
# first disable and stop httpd daemon
systemctl disable httpd

# now we stop httpd daemon
echo "Stopping httpd services from running"
systemctl stop httpd

# precompile for development
echo "precompiling everything for production environment"
RAILS_ENV=production rails assets:precompile

# start the server
echo "starting the server in production" 
rails server -b 0.0.0.0 -p 80 -e production  
