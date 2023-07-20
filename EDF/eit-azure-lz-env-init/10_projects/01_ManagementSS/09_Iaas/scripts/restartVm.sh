#!/bin/bash

resourceGroupName=$1
vmName=$2

az vm restart -g $resourceGroupName -n $vmName
