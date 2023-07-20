#!/bin/bash

sudo -i
#Assign Variables
domain_name="$1"
user="$2"
password="$3"
nameserverip1="$4"
nameserverip2="$5"
dcinfo1="$6"
dcinfo2="$7"
dchname1="$8"
dchname2="$9"
GROUP="${10}"
GROUP2="${11}"
hostname="${12}"
ou="OU=Application,OU=Azure UKS,OU=EDF Linux Servers,DC=edf-hs,DC=com"
GROUP1="%Domain\ Admins@edf-hs.com"


#ou2=$(sed -e "s/ouPath=//g" <<<"$ou")
sed -i "/^search.*/a nameserver $nameserverip1" /etc/resolv.conf
sed -i "/^search.*/a nameserver $nameserverip2" /etc/resolv.conf
sed -i "/^::1.*/a $nameserverip1 $dcinfo1 $dchname1"  /etc/hosts
sed -i "/^::1.*/a $nameserverip2 $dcinfo2 $dchname2"  /etc/hosts

sudo hostnamectl set-hostname "$hostname"
echo "install required packages"
sudo DEBIAN_FRONTEND=noninteractive apt-get update -yq
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -yq
echo "install required packages"
sudo DEBIAN_FRONTEND=noninteractive apt install realmd samba samba-common sssd packagekit -yq
sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install krb5-user
# sudo dpkg --configure -a
# apt-get install -y krb5-user
# export DEBIAN_FRONTEND=noninteractive
echo "install required packages krb"
# sudo -E apt -y -qq install krb5-user
sed -i '9 i \       \ rdns = false' /etc/krb5.conf
sudo pam-auth-update --enable mkhomedir --force
echo "installed successfully"
realm discover "$domain_name"
sudo echo "$password"|sudo realm join --verbose -U "$user" "$domain_name" --computer-ou="$ou"
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
sudo systemctl restart sshd
sudo systemctl restart sssd
