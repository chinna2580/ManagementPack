#!/bin/vbash
source /opt/vyatta/etc/functions/script-template
sudo cp /config/config.boot /config/config.test
sudo rm /config/config.boot
configure
set int eth eth0 addr 192.168.1.251/24
set service ssh port 22
commit
save
exit
reboot
echo yes
