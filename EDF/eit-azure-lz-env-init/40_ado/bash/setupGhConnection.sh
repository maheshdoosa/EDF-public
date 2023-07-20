#!/bin/bash

echo $adoOrganisation=$1
echo $adoProject=$2
echo $ghPat=$3
echo $ghServiceEndpointName=$4
echo $ghRepoUrl=$5
echo $adoPipelineName=$6
echo $pipelineYamlPath=$7


#Create GitHub Service Endpoint
export AZURE_DEVOPS_EXT_GITHUB_PAT=$ghPat
serviceConnectionId=$(az devops service-endpoint github create --name $ghServiceEndpointName --github-url $ghRepoUrl --organization $adoOrganisation --project $adoProject --query id -o tsv)

#Create Pipeline in ADO
az pipelines create --name $adoPipelineName --repository $ghRepoUrl --branch master --service-connection $serviceConnectionId --skip-first-run true --yml-path $pipelineYamlPath --repository-type github  --organization $adoOrganisation --project $adoProject
