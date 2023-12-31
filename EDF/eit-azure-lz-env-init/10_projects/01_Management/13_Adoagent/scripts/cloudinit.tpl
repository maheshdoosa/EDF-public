#cloud-config
package_upgrade: true
packages:
  - curl
  - wget
  - unzip
  - apt-transport-https
  - ca-certificates
  - gnupg-agent
  - software-properties-common

runcmd:
 #
 # Create Folder under Home/User directory
 #
 - mkdir azagent; cd azagent
 - echo "[$(date +%F_%T)] $(pwd)" # >> ./ado_cloud_init.log
 - echo "[$(date +%F_%T)] Starting cloud_init script" # >> ./ado_cloud_init.log
 - apt install curl -y
 - apt install wget -y
 - apt install unzip -y

 #
 # Install Azure CLI Deb
 #
 - echo "[$(date +%F_%T)] Installing Azure CLI"
 - curl -sL https://aka.ms/InstallAzureCLIDeb | bash

 #
 # Install Terraform
 #
 - echo "[$(date +%F_%T)] Installing Terraform"
 - wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip
 - unzip terraform*.zip
 - mv terraform /usr/local/bin

 #
 # Install Packer
 #
 - wget "https://releases.hashicorp.com/packer/1.6.0/packer_1.6.0_linux_amd64.zip"
 - unzip packer*.zip
 - mv packer /usr/local/bin

 #
 # Downloding and installing VSTS agent package
 #
 - echo "[$(date +%F_%T)] Downloading Agent"
 - chmod ugo+rwx -R /azagent
 - curl -fkSL -o vsts-agent.tar.gz https://vstsagentpackage.azureedge.net/agent/2.164.8/vsts-agent-linux-x64-2.164.8.tar.gz
 - echo "[$(date +%F_%T)] Extracting Agent"
 - tar -zxvf vsts-agent.tar.gz
 - chmod ugo+rwx -R /azagent
 - echo "[$(date +%F_%T)] Running installdependencies.sh"
 - ./bin/installdependencies.sh
 - echo "[$(date +%F_%T)] Running config.sh"
 - if [ "${proxy_url}" == "" ]; then echo "[$(date +%F_%T)] -- No proxy specified."; else echo "[$(date +%F_%T)] -- Proxy specified."; fi
 - if [ "${proxy_url}" == "" ]; then sudo -u ${vm_admin} ./config.sh --unattended --url "${server_url}" --auth pat --token "${pat_token}" --pool "${pool_name}" --agent $HOSTNAME --work _work --acceptTeeEula --replace; else sudo -u ${vm_admin} ./config.sh --unattended --url "${server_url}" --auth pat --token "${pat_token}" --pool "${pool_name}" --agent $HOSTNAME --work _work --acceptTeeEula --replace --proxyurl "${proxy_url}" --proxyusername "${proxy_username}" --proxypassword "${proxy_password}"; fi
 - echo "[$(date +%F_%T)] Running scv.sh"
 - ./svc.sh install
 - ./svc.sh start
 - STR='${proxy_bypass}'; echo "$STR" > /azagent/.proxybypass

power_state:
 delay: "+1"
 mode: reboot
 message: Rebooting after ADO configuration
 timeout: 30
 condition: True
