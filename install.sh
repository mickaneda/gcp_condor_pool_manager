#!/bin/sh

cp bin/gcpm /usr/bin/
[ -f /etc/gcpm.conf ] || cp etc/gcpm.conf /etc/
cp system/gcpm.service /etc/systemd/system/
