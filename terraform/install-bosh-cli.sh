#!/usr/bin/env bash

sudo apt-get -y install build-essential ruby ruby-dev libxml2-dev libsqlite3-dev libxslt1-dev libpq-dev libmysqlclient-dev zlib1g-dev

gem install bosh_cli --no-ri --no-rdocc
