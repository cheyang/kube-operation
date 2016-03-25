#!/bin/bash
PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/usr/local/bin:$PATH
export PATH

HOSTNAME=`hostname -s`

if [ -n "$API_SERVER" ]; then
   $API_SERVER_PARAMETER="--server=$API_SERVER"
fi

kubectl $API_SERVER_PARAMETER get no -o=json|grep '"address":'|uniq|awk '{print $2}'
