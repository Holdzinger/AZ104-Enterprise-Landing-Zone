targetScope = 'resourceGroup'

param location string

resource keyVault 'Microsoft.KeyVault/vaults@2023-07-01' = {
  name: 'kv-lexcorp-prod'
  location: location

  properties: {
    enableRbacAuthorization: true
    enablePurgeProtection: true
    publicNetworkAccess: 'Disabled'

    tenantId: subscription().tenantId

    sku: {
      family: 'A'
      name: 'standard'
    }
  }
}

output keyVaultId string = keyVault.id
