#!/bin/bash

# Exit if any of the intermediate steps fail
set -e

# Parameters:
# $1 => Pass the Authenticate API key
# $2 => Pass the enrollment ID for add the account

apikey=$1
enrollmentid=$2

#Authenticate using API key

# login=`curl https://api.cloudability.com/v3/vendors -u "$apikey:" | jq -c -r '.result[1].key'`
login=$(curl https://api.cloudability.com/v3/vendors -u "$apikey:" | jq -c -r '.result[1].key')

# if [ $login == azure ]
if [ "$login" == azure ]
then
   echo "api authentication successful"
else
   echo "api authentication failed"
fi

#get the non verified subscription list and name

# nonverified_sub_list=`curl https://api.cloudability.com/v3/vendors/azure/accounts/?viewId=0 -u "$apikey:"  | jq --arg keyvar "$enrollmentid" -c '[.result[] | select((.parentAccountId == $keyvar) and ((.verification == null) or (.verification.state | contains("error") or contains("unverified")))).id]' | tr -d '\n'`
# nonverified_sub_list_name=`curl https://api.cloudability.com/v3/vendors/azure/accounts/?viewId=0 -u "$apikey:"  | jq --arg keyvar "$enrollmentid" -c '.result[] | select((.parentAccountId == $keyvar) and ((.verification == null) or (.verification.state | contains("error") or contains("unverified")))).vendorAccountName'`

nonverified_sub_list=$(curl https://api.cloudability.com/v3/vendors/azure/accounts/?viewId=0 -u "$apikey:"  | jq --arg keyvar "$enrollmentid" -c '[.result[] | select((.parentAccountId == $keyvar) and ((.verification == null) or (.verification.state | contains("error") or contains("unverified")))).id]' | tr -d '\n')
nonverified_sub_list_name=$(curl https://api.cloudability.com/v3/vendors/azure/accounts/?viewId=0 -u "$apikey:"  | jq --arg keyvar "$enrollmentid" -c '.result[] | select((.parentAccountId == $keyvar) and ((.verification == null) or (.verification.state | contains("error") or contains("unverified")))).vendorAccountName')

echo "$nonverified_sub_list_name"

#fetch the URLs and integrate Azure subscriptions to cloudability for authenticate in azure

if [[ -z "$nonverified_sub_list" ]]
then
  # echo "no pending verification for this "$enrollmentid" enrollment id"
  echo "no pending verification for this ""$enrollmentid"" enrollment id"
else
  # auth_url=`curl -X POST -H "Content-Type: application/json" -d "{\"vendorAccountIds\": $nonverified_sub_list}" "https://api.cloudability.com/v3/vendors/azure/accounts/$enrollmentid/auth-locations?viewId=0" -u "$apikey:"`
  auth_url=$(curl -X POST -H "Content-Type: application/json" -d "{\"vendorAccountIds\": $nonverified_sub_list}" "https://api.cloudability.com/v3/vendors/azure/accounts/$enrollmentid/auth-locations?viewId=0" -u "$apikey:")
  echo  "verification links were generated and need to authorize that links by service owner"
fi

echo "$auth_url" | jq '.result[].authUrl' > result_cloudability.txt
