#!/bin/sh -l

# install package

# ...first add the Cloud Foundry Foundation public key and package repository to your system
wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | gpg --dearmor -o /usr/share/keyrings/cli.cloudfoundry.org.gpg
echo "deb https://packages.cloudfoundry.org/debian stable main" | sudo tee /etc/apt/sources.list.d/cloudfoundry-cli.list
# ...then, update your local package index, then finally install the cf CLI
sudo apt-get update
sudo apt-get install -y $INPUT_PACKAGE_NAME

# verify version
cf version

# add plugins
cf add-plugin-repo CF-Community https://plugins.cloudfoundry.org
cf install-plugin https://github.com/cloudfoundry-incubator/multiapps-cli-plugin/releases/latest/download/multiapps-plugin.linux32 -f

# login
cf login -a "$INPUT_CF_API" -u "$INPUT_CF_USER" -p "$INPUT_CF_PWD" -o "$INPUT_CF_ORG" -s "$INPUT_CF_SPACE"

# execute command
sh -c "cf $*"
