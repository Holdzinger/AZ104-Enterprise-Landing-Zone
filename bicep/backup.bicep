param location string

resource vault 'Microsoft.RecoveryServices/vaults@2023-02-01' = {
  name: 'rsv-lexcorp-prod'
  location: location

  sku: {
    name: 'Standard'
  }

  properties: {
    publicNetworkAccess: 'Enabled'
  }
}

