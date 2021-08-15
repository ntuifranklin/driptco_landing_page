#!/bin/bash
# This scripts starts the rails app  production server

echo "precompiling everything for development environment"
RAILS_ENV=development /home/franklin/.rvm/gems/ruby-3.0.0/bin/rails assets:precompile
RAILS_ENV=development rake db:reset db:migrate db:seed

echo "changing file permission for tmp and public folder"
chmod -R 755 *
chmod -R 777 tmp
chmod -R 777 public
echo "chaninging ownership and assigning to user nginx for root folder"
chown -R franklin:franklin  .
echo "\n"
