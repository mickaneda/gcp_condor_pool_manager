#!/bin/sh

cp bin/gcpm /usr/bin/
echo "/usr/bin/gcpm was installed"
if [ ! -f /etc/gcpm.conf ];then
  cp etc/gcpm.conf /etc/
  echo "/etc/gcpm.conf was installed"
fi
cp etc/systemd/system/gcpm.service /etc/systemd/system/
echo "/etc/systemd/system/gcpm.service was installed"
cp etc/rsyslog.d/gcpm.conf /etc/rsyslog.d/
systemctl daemon-reload
echo "/etc/rsyslog/gcpm.conf was installed"
systemctl restart rsyslog
mkdir -p /var/run/gcpm
echo

gcloud=($(grep "^gcloud " /etc/gcpm.conf 2>/dev/null))
gcloud=${gcloud[1]:-/root/google-cloud-sdk/bin/gcloud}
if ! type "$gcloud" >/dev/null 2>&1;then
  echo "gcloud tool is not installed or not in $gcloud"
  echo "Please install gcloud and/or set path in your configuration file as 'gcloud /path/to/gcloud'"
  echo "Ref: https://cloud.google.com/sdk/install"
fi
