#!/bin/bash

IP=`/usr/bin/etcdctl get /rexsterIP`

mv config/rexster.xml config/rexster.xml.orig
cat config/rexster.xml.orig | sed -e "/<base-uri>/s/localhost/""$IP""/" > config/rexster.xml

./bin/rexster.sh --start
