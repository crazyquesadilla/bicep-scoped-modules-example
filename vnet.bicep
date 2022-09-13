param vnetName string
param ipv4Prefix string

param location string

resource vnet 'Microsoft.Network/virtualNetworks@2021-08-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        ipv4Prefix
      ]
    }
  }
}
