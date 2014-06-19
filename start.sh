#!/bin/bash

IP=`/usr/bin/etcdctl --peers 10.1.42.1:4001 get /rexsterIP`


mv config/rexster.xml config/rexster.xml.orig
cat config/rexster.xml.orig | sed -e "/<base-uri>/s/localhost/""$IP""/" > config/rexster.xml

./bin/rexster.sh --start
