#!/bin/bash

# watch -c mservices.sh

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
 
services=(`cd /etc/systemd/system/multi-user.target.wants/ &&  ls *.service`)

for i in "${services[@]}"                                                        
do                                                                                 
 EN=$(systemctl is-enabled $i 2>&-)
 AC=$(systemctl is-active $i 2>&-)
 if [ $EN == "enabled" ] && [ $AC == "active" ]; then
   printf "$i ==> ${GREEN}${EN} : ${AC}${NC} \n"                                  
  else
   printf "$i ==> ${RED}${EN} : ${AC}${NC} \n"
  fi
  #echo $REZ
 done
