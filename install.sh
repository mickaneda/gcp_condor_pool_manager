#!/usr/bin/env bash

echo
echo "###############################################"
echo "Install gcpm to /opt/"
echo "###############################################"
echo
url="https://github.com/mickaneda/gcp_condor_pool_manager/archive/master.tar.gz"
mkdir -p /opt/
cd /opt
if type git >&/dev/null;then
  git clone https://github.com/mickaneda/gcp_condor_pool_manager.git
elif type curl >&/dev/null;then
  curl -s -L -O  https://github.com/mickaneda/gcp_condor_pool_manager/archive/master.tar.gz
  tar zxf master.tar.gz
  rm -f master.tar.gz
elif type wget >&/dev/null;then
  wget -q   https://github.com/mickaneda/gcp_condor_pool_manager/archive/master.tar.gz
  tar zxf master.tar.gz
  rm -f master.tar.gz
else
  echo "no download method is available, please get files from https://github.com/mickaneda/gcp_condor_pool_manager"
  exit
fi
cd gcp_condor_pool_manager/scripts
./install.sh
