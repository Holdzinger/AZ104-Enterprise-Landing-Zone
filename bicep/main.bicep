targetScope = 'resourceGroup'

@description('Deployment location')
param location string = resourceGroup().location

@description('Virtual Network Name')
param vnetName string = 'vnet-lexcorp-prod'

@description('Virtual Machine Name')
param vmName string = 'vm-lexcorp-app01'

@description('Key Vault Name')
param keyVaultName string = 'kv-lexcorp-prod'

@description('Log Analytics Workspace Name')
param workspaceName string = 'law-lexcorp-prod'

@description('Recovery Services Vault Name')
param recoveryVaultName string = 'rsv-lexcorp-prod'

@description('Azure Bastion Name')
param bastionName string = 'bas-lexcorp-prod'

@description('Azure Bastion Public IP Name')
param bastionPublicIpName string = 'pip-bastion-prod'

@description('Action Group Name')
param actionGroupName string = 'ag-lexcorp-prod'

@description('Alert Notification Email')
param emailAddress string = 'admin@lexcorp.local'

module network './bicep/network.bicep' = {
  name: 'networkDeployment'

  params: {
    location: location
    vnetName: vnetName
    nsgName: 'nsg-app-subnet'
    subnetName: 'app-subnet'
  }
}

module monitoring './bicep/monitoring.bicep' = {
  name: 'monitoringDeployment'

  params: {
    location: location
    workspaceName: workspaceName
    actionGroupName: actionGroupName
    emailAddress: emailAddress
  }
}

module keyvault './bicep/keyvault.bicep' = {
  name: 'keyVaultDeployment'

  params: {
    location: location
    keyVaultName: keyVaultName
  }
}

module backup './bicep/backup.bicep' = {
  name: 'backupDeployment'

  params: {
    location: location
    recoveryVaultName: recoveryVaultName
  }
}

module bastion './bicep/bastion.bicep' = {
  name: 'bastionDeployment'

  params: {
    location: location
    bastionName: bastionName
    publicIpName: bastionPublicIpName
    vnetName: vnetName
  }
}

module vm './bicep/vm.bicep' = {
  name: 'vmDeployment'

  params: {
    location: location
    vmName: vmName
    subnetId: network.outputs.subnetId
  }
}

output virtualNetworkId string = network.outputs.vnetId
output subnetId string = network.outputs.subnetId
output workspaceId string = monitoring.outputs.workspaceId
output keyVaultId string = keyvault.outputs.keyVaultId
output recoveryVaultId string = backup.outputs.recoveryVaultId
