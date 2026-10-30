param location string

resource workspace 'Microsoft.OperationalInsights/workspaces@2023-09-01' = {
  name: 'law-lexcorp-prod'
  location: location

  properties: {
    sku: {
      name: 'PerGB2018'
    }

    retentionInDays: 30
  }
}

output workspaceId string = workspace.id

