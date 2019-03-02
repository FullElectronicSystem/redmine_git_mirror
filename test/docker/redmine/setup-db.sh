#!/usr/bin/env bash

set -e

echo "
test:
  adapter: sqlite3
  encoding: utf8
  database: ${HOME}/test.db
" > config/database.yml

cp Gemfile.lock.sqlite3 Gemfile.lock || true
