targetScope = 'resourceGroup'

param location string

resource workspace 'Microsoft.OperationalInsights/workspaces@2023-09-01' = {
  name: 'law-lexcorp-prod'
  location: location

  sku: {
    name: 'PerGB2018'
  }

  properties: {
    retentionInDays: 30
  }
}

output workspaceId string = workspace.id
output workspaceName string = workspace.name
