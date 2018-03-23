#!/bin/bash

set +e
set -x

# set python 3.6.4
pyenv local 3.6.4

# install AWS cli
pip install awscli --upgrade

echo "verify AWS cli has been installed"
aws --version

echo "install other stuff"
brew tap cloudfoundry/tap
brew install bosh-cli

brew install terraform

set -e
set +x
