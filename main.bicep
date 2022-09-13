param timestamp string = utcNow('yyyyMMdd-HHmm') // in a lot of cases, we need the deployment name to change

param location string = 'westus2'
param resourceGroupName string = 'rgp-bicep-test'

param vnetName string = 'vnet-bicep-test'
param vnetIPv4Prefix string = '10.254.255.0/28'

targetScope = 'subscription' 
// start out at the subscription scope, 
// so you can create the resource group and scope from there

module rg 'rgp.bicep' = {
  name: '${timestamp}-rg' // this is just the deployment name, which doesn't affect the resource itself
  params: {
    resourceLocation: location
    resourceGroupName: resourceGroupName
  }
}

module vnet 'vnet.bicep' = {
  name: '${timestamp}-vnet' // this is just the deployment name, which doesn't affect the resource itself
  scope: resourceGroup(resourceGroupName) 
  // run this module under the resource group scope
  // you can't set it to the ID because the ID export is dynamically set,
  // and you can only scope to contexts that make sense at compile time

  params: {
    location: location
    vnetName: vnetName
    ipv4Prefix: vnetIPv4Prefix
  }

  dependsOn: [
    rg
  ]
  // this module can't run until the resource group is created
  // this wouldn't be necessary if we were trying to pull an output from another module,
  // because Bicep would know to run that other module first to get that output
}

