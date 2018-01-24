#!/bin/bash

set -e

me=$(hostname)

mongo1=$(getent hosts mongo1 | awk '{ print $1 }')
mongo2=$(getent hosts mongo2 | awk '{ print $1 }')
mongo3=$(getent hosts mongo3 | awk '{ print $1 }')

if [ -z "$mongo1" ] ; then exit 1 ; fi;
if [ -z "$mongo2" ] ; then exit 1 ; fi;
if [ -z "$mongo3" ] ; then exit 1 ; fi;

echo "me: $me" >> /mongo/logs/$me.log
echo "mongo1: $mongo1" >> /mongo/logs/$me.log
echo "mongo2: $mongo2" >> /mongo/logs/$me.log
echo "mongo3: $mongo3" >> /mongo/logs/$me.log

/mongo/mongodb-linux-x86_64-3.6.1/bin/mongod --dbpath /mongo/mem --replSet rs0 --port 27017 --bind_ip 0.0.0.0 >> /mongo/logs/$me.log