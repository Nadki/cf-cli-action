#!/bin/sh -l

# install package
apt-get update
apt-get install -y ca-certificates jq
echo "deb [trusted=yes] https://packages.cloudfoundry.org/debian stable main" > /etc/apt/sources.list.d/cloudfoundry-cli.list
apt-get update
apt-get install -y $INPUT_PACKAGE_NAME

# verify version
cf version

# add plugins
cf add-plugin-repo CF-Community https://plugins.cloudfoundry.org
cf install-plugin https://github.com/cloudfoundry-incubator/multiapps-cli-plugin/releases/latest/download/multiapps-plugin.linux32 -f

# login
cf login -a "$INPUT_CF_API" -u "$INPUT_CF_USER" -p "$INPUT_CF_PWD" -o "$INPUT_CF_ORG" -s "$INPUT_CF_SPACE"

# execute command
sh -c "cf $*"
