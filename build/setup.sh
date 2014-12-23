#!/bin/sh
gh=$HOME/.gem/ruby/2.1.0
if [ ! -d "$gh" ]; then mkdir -p $gh; fi
cd /home/app/docker_demo
bundle --path "$gh"
bundle exec rake db:migrate
unset gh
