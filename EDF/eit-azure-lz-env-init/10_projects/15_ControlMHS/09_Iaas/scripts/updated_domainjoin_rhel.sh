#!/bin/sh
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

sudo hostnamectl set-hostname "$hostname"
#Handling oupath in the string
#
#ou2=$(sed -e "s/ouPath=//g" <<<$ou)
#Updating resolv and hosts with dc values
#ou2=$(sed -e "s/ouPath=//g" <<<"$ou")
sed -i "/^search.*/a nameserver $nameserverip1" /etc/resolv.conf
sed -i "/^search.*/a nameserver $nameserverip2" /etc/resolv.conf
sed -i "/^::1.*/a $nameserverip1 $dcinfo1 $dchname1" /etc/hosts
sed -i "/^::1.*/a $nameserverip2 $dcinfo2 $dchname2" /etc/hosts

#install required packages
echo "install required packages"
sudo yum install realmd sssd krb5-workstation samba-common-tools -y
echo "installed successfully"
realm discover "$domain_name"
sudo echo "$password"|sudo realm join --verbose -U "$user" "$domain_name" --computer-ou="$ou"

sudo realm deny --all
sudo realm permit -g 'Domain Admins' 'devops_temp_admins'
# Take a backup of sudoers file and change the backup file.
sudo cp /etc/sudoers /tmp/sudoers.bak

# sudo echo "Cmnd_Alias DISCO=/usr/sbin/dmidecode,/sbin/dmsetup table *,/sbin/multipath -ll,/sbin/fdisk -l,/usr/sbin/lsof" >> /tmp/sudoers.bak
# sudo echo "$GROUP ALL=(ALL) NOPASSWD:DISCO" >> /tmp/sudoers.bak
# sudo echo "$GROUP1 ALL=(ALL) ALL" >> /tmp/sudoers.bak
# sudo echo "$GROUP2 ALL=(ALL) ALL" >> /tmp/sudoers.bak
echo "Cmnd_Alias DISCO=/usr/sbin/dmidecode/sbin/dmsetup table *;/sbin/multipath -ll;/sbin/fdisk -l;/usr/sbin/lsof" | sudo tee -a /tmp/sudoers.bak > /dev/null
echo "$GROUP ALL=(ALL) NOPASSWD:DISCO" | sudo tee -a /tmp/sudoers.bak > /dev/null
echo "$GROUP1 ALL=(ALL) ALL" | sudo tee -a /tmp/sudoers.bak > /dev/null
echo "$GROUP2 ALL=(ALL) ALL" | sudo tee -a /tmp/sudoers.bak > /dev/null

# Check syntax of the backup file to make sure it is correct.
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
sudo systemctl restart sssd
