#!/bin/bash

# This script is designed to simplify vic-machine usage, but using a single JSON manifest as input to all commands
# The expected layout is that a particular vic-machine configuration will be in a subdirectory of the current dir
# In that subdirectory should be a config.json file which conforms to the format in example.json 
# That subdirectory is then both the input and working directory of vic-machine
# As such, generated certificates and log files will be written to that sub directory as root user

if [  $# -le 2 ] 
then 
   echo "Usage: vic-machine.sh <version> <config-dir> <action>"
   echo "  Where version is \"latest\" or <version number>-<optional rc> eg. 1.0.0-rc5"
   echo "  Where action is one of: create | delete | inspect | ls | debug | upgrade | rollback"
   exit 1
fi

VERSION=latest
docker run -v $(pwd)/$2:/config bensdoings/vic-machine-$3:$VERSION