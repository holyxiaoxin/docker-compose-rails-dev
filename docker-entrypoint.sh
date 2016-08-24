#!/bin/bash

wait-for-it db:5432
bundle exec rake db:migrate
exec bundle exec rails s -p 3000 -b 0.0.0.0
