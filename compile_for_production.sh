#!/bin/bash
# This scripts starts the rails app  production server

echo "precompiling everything for production environment"
RAILS_ENV=production rails assets:precompile

echo "changing file permission for tmp and publi folder"
chmod -R 777 tmp
chmod -R 777 public
echo "\n"
