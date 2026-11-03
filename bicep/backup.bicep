targetScope = 'resourceGroup'

param location string

resource recoveryVault 'Microsoft.RecoveryServices/vaults@2023-08-01' = {
  name: 'rsv-lexcorp-prod'
  location: location

  sku: {
    name: 'Standard'
  }

  properties: {}
}

output recoveryVaultId string = recoveryVault.id
