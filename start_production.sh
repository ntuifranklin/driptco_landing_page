#!/bin/bash
# This scripts starts the rails app server
# It is owned by root

# first disable and stop httpd daemon
systemctl disable httpd

# now we stop httpd daemon
systemctl stop httpd

RAILS_ENV=production rails assets:precompile

# start the server
rails server -b 0.0.0.0 -p 80 -e production  
 
