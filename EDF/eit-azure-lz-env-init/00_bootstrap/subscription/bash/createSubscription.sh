#!/bin/bash

subscriptionName=$1
ownerSpn=$2
#accountUserName=$3
#accountUserPassword=$4

adoPat=$5
ownerSpnKey=$6
armServiceConnectionName=$7
tenantId=$8
adoOrganisation=$9
adoProject="${10}"

#az login --service-principal -u $accountUserName -p $accountUserPassword --tenant $tenantId

#enrollmentAccountObjectId=$(az billing enrollment-account list --query [].name -o tsv)
ownerObjectId=$ownerObjectId

existingSubscription=$(az account list --query "[?name=='$subscriptionName'].name" -o tsv)

if [ -z "$existingSubscription" ]
then
    echo "Subscription does not exist. Creating..!!"
    #az extension add --name subscription
    #az account create --offer-type "MS-AZR-0017P" --display-name "$subscriptionName" --enrollment-account-object-id $enrollmentAccountObjectId --owner-spn $ownerSpn
    newSubscriptionId=$(az account list --query "[?name=='$subscriptionName'].id" -o tsv)

    echo $newSubscriptionId

    export AZURE_DEVOPS_EXT_PAT=$adoPat
    export AZURE_DEVOPS_EXT_AZURE_RM_SERVICE_PRINCIPAL_KEY=$ownerSpnKey
    az devops service-endpoint azurerm create --name $armServiceConnectionName --azure-rm-tenant-id $tenantId --azure-rm-service-principal-id $ownerSpn --azure-rm-subscription-id $newSubscriptionId --azure-rm-subscription-name $subscriptionName --organization $adoOrganisation --project $adoProject
else
    echo "Subscription already exist. Skipping..!!"
fi
