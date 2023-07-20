#!/bin/sh
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
#Handling oupath in the string
# ou2=$(sed -e "s/ouPath=//g" <<<$ou) #### Provide ou path without "ouPath=" in tfvars, also please refer domainjoin_ubuntu.sh file
#Updating resolv and hosts with dc values
sed -i "/^search.*/a nameserver $nameserverip" /etc/resolv.conf
sed -i "/^::1.*/a $nameserverip $dcinfo $dchname"  /etc/hosts
#install required packages
yum -y --force install realmd sssd krb5-workstation samba-common-tools # krb5-lids doesnt seem to work
realm discover "$domain_name"
echo "$password"| realm join --verbose -U "$user" "$domain_name" --computer-ou="$ou"

# Take a backup of sudoers file and change the backup file.
sudo cp /etc/sudoers /tmp/sudoers.bak
#sudo echo "$GROUP ALL=(ALL) NOPASSWD:ALL" >> /tmp/sudoers.bak
echo "$GROUP ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /tmp/sudoers.bak

# Check syntax of the backup file to make sure it is correct.
sudo visudo -cf /tmp/sudoers.bak
# if [ $? -eq 0 ]; then
if sudo visudo -cf /tmp/sudoers.bak ; then
   #Replace the sudoers file with the new only if syntax is correct.
  sudo cp /tmp/sudoers.bak /etc/sudoers
else
  echo "Could not modify /etc/sudoers file. Please do this manually."
fi
systemctl restart sshd
