targetScope = 'resourceGroup'

param location string = resourceGroup().location

module network './bicep/network.bicep' = {
  name: 'networkDeployment'
  params: {
    location: location
  }
}

module monitoring './bicep/monitoring.bicep' = {
  name: 'monitoringDeployment'
  params: {
    location: location
  }
}

module backup './bicep/backup.bicep' = {
  name: 'backupDeployment'
  params: {
    location: location
  }
}

module bastion './bicep/bastion.bicep' = {
  name: 'bastionDeployment'
  params: {
    location: location
    vnetName: 'vnet-lexcorp-prod'
  }
}

module vm './bicep/vm.bicep' = {
  name: 'vmDeployment'
  params: {
    location: location
    subnetId: network.outputs.subnetId
  }
}
