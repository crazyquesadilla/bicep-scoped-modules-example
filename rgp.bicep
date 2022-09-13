param resourceGroupName string
param resourceLocation string

targetScope = 'subscription'

resource rgp 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: resourceLocation
}
