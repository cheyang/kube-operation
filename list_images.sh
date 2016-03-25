#!/bin/bash
#!/bin/bash
PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/usr/local/bin:$PATH
export PATH

HOSTNAME=`hostname -s`

if [ -n "$API_SERVER" ]; then
    images=`kubectl --server=$API_SERVER describe rc|grep 'Image(s)'|awk '{print $2}'`
    for str in $images; do
      arr=(${str//,/ })
      for i in ${arr[@]}  
      do  
       new_image_name="${i/ACT$/UT}"
       echo $new_image_name
      done  
    done

    
else
   echo "The environment variable API_SERVER does not correct."
   exit
fi
