#!/bin/bash

sudo -i
#Assign Variables
domain_name="$1"
ou="$2"
user="$3"
password="$4"
GROUP="$5"
nameserverip="$6"
dcinfo="$7"
dchname="$8"
GROUP1="$9"
GROUP2="${10}"

#ou2=$(sed -e "s/ouPath=//g" <<<"$ou")
sed -i "/^search.*/a nameserver $nameserverip" /etc/resolv.conf
sed -i "/^::1.*/a $nameserverip $dcinfo $dchname"  /etc/hosts
#echo "install required packages"
#sudo apt-get update -y
#sudo apt-get upgrade -y
#sudo apt install realmd samba samba-common sssd krb5-user -y
sed -i '9 i \       \ rdns = false' /etc/krb5.conf
echo "installed successfully"
realm discover "$domain_name"
echo "$password"| realm join --verbose -U "$user" "$domain_name" --computer-ou="$ou"
sudo realm deny --all
sudo realm permit -g 'Domain Admins' 'devops_temp_admins'
sudo cp /etc/sudoers /tmp/sudoers.bak
# sudo echo "Cmnd_Alias DISCO=/usr/sbin/dmidecode,/sbin/dmsetup table *,/sbin/multipath -ll,/sbin/fdisk -l,/usr/sbin/lsof" >> /tmp/sudoers.bak
# sudo echo "$GROUP ALL=(ALL) NOPASSWD:DISCO" >> /tmp/sudoers.bak
# sudo echo "$GROUP1 ALL=(ALL) ALL" >> /tmp/sudoers.bak
# sudo echo "$GROUP2 ALL=(ALL) ALL" >> /tmp/sudoers.bak
echo "Cmnd_Alias DISCO=/usr/sbin/dmidecode/sbin/dmsetup table *;/sbin/multipath -ll;/sbin/fdisk -l;/usr/sbin/lsof" | sudo tee -a /tmp/sudoers.bak > /dev/null
echo "$GROUP ALL=(ALL) NOPASSWD:DISCO" | sudo tee -a /tmp/sudoers.bak > /dev/null
echo "$GROUP1 ALL=(ALL) ALL" | sudo tee -a /tmp/sudoers.bak > /dev/null
echo "$GROUP2 ALL=(ALL) ALL" | sudo tee -a /tmp/sudoers.bak > /dev/null
sudo visudo -cf /tmp/sudoers.bak
# if [ $? -eq 0 ]; then
if sudo visudo -cf /tmp/sudoers.bak ; then
   #Replace the sudoers file with the new only if syntax is correct.
  sudo cp /tmp/sudoers.bak /etc/sudoers
  echo "added using script"
else
  echo "Could not modify /etc/sudoers file. Please do this manually."
fi
systemctl restart sshd
