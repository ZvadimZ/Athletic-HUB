#!/usr/bin/env bash
# exit on error
chmod u+x bin/rails
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate