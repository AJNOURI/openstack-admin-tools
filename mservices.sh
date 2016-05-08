#!/bin/bash


RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color


osservices=(\
 openstack-nova-api \
 openstack-nova-cert \
 openstack-nova-consoleauth \
 openstack-nova-scheduler \
 openstack-nova-conductor \
 openstack-nova-novncproxy \
 neutron-server \
 neutron-dhcp-agent \
 neutron-l3-agent \
 neutron-metadata-agent \
 neutron-openvswitch-agent \
 openstack-cinder-api \
 openstack-cinder-backup \
 openstack-cinder-scheduler\
 )

for i in "${osservices[@]}"                                                        
do                                                                                 
 EN=$(systemctl is-enabled $i.service 2>&-)
 AC=$(systemctl is-active $i.service 2>&-)
 if [ $EN == "enabled" ] && [ $AC == "active" ]; then
   printf "$i ==> ${GREEN}${EN} : ${AC}${NC} \n"                                  
  else
   printf "$i ==> ${RED}${EN} : ${AC}${NC} \n"
  fi
  #echo $REZ
 done
