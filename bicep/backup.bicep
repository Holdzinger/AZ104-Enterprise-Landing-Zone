targetScope = 'resourceGroup'

param location string
param recoveryVaultname string

resource recoveryVault 'Microsoft.RecoveryServices/vaults@2023-08-01' = {
  name: recoveryVaultname
  location: location

  sku: {
    name: 'Standard'
  }

  properties: {}
}

output recoveryVaultId string = recoveryVault.id
