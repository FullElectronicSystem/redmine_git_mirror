#!/usr/bin/env sh

set -e

cd /usr/src/redmine

setup-db

echo "=== Installing dependencies"
bundle install --with test > /dev/null

echo "=== Migrating Database"
rake db:create db:migrate redmine:plugins:migrate RAILS_ENV=test > /dev/null

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo " Ruby:" `ruby -v`
echo " Rails:" `./bin/rails runner "puts Rails::VERSION::STRING"`
echo " Redmine:" `./bin/rails runner "puts Redmine::VERSION.to_s"`
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

exec "$@"
