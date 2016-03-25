#!/bin/bash
PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/usr/local/bin:$PATH
export PATH

HOSTNAME=`hostname -s`

if [ -n "$API_SERVER" ]; then
   $API_SERVER_PARAMETER="--server=$API_SERVER"
fi

nodes=`kubectl $API_SERVER_PARAMETER get no -o=json|grep '"address":'|uniq|awk '{print $2}'`

for node in $nodes; do
      str="${node//\"}"
      echo $str
    done
