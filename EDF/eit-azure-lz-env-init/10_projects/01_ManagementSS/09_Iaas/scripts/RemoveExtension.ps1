#param ($extName, $resourceGroupName, $additionalVMName, $spSecret, $tenantId, $subscriptionId, $spApplicationId)
param ($extName, $resourceGroupName, $additionalVMName, $spSecret, $tenantId, $spApplicationId)
# $userIdPassword = ConvertTo-SecureString -String $spSecret -AsPlainText -Force
# $pscredential = New-Object -TypeName System.Management.Automation.PSCredential($spApplicationId, $spSecret)
# Connect-AzAccount -ServicePrincipal -Credential $pscredential -Tenant $tenantId -Subscription $subscriptionId

az login --service-principal -u $spApplicationId -p $spSecret --tenant $tenantId

#Remove the vm extension
#Remove-AzVMCustomScriptExtension -Name $extName -ResourceGroupName $resourceGroupName -VMName $vmName -force
az vm extension delete -g $resourceGroupName --vm-name $additionalVMName -n $extName
