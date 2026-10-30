targetScope = 'subscription'

@description('Azure region for metadata. Resource groups can host resources in any region.')
param location string = 'southafricanorth'

resource rgNetwork 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: 'RG-Network'
  location: location
}

resource rgCompute 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: 'RG-Compute'
  location: location
}

resource rgMonitoring 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: 'RG-Monitoring'
  location: location
}

resource rgBackup 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: 'RG-Backup'
  location: location
}

resource rgManagement 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: 'RG-Management'
  location: location
}

output resourceGroups array = [
  rgNetwork.name
  rgCompute.name
  rgMonitoring.name
  rgBackup.name
  rgManagement.name
]
