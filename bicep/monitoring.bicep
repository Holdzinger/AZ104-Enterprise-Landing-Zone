targetScope = 'resourceGroup'

@description('Deployment location')
param location string

@description('Log Analytics Workspace Name')
param workspaceName string = 'law-lexcorp-prod'

@description('Action Group Name')
param actionGroupName string = 'ag-lexcorp-prod'

@description('Notification Email Address')
param emailAddress string = 'admin@lexcorp.local'

resource workspace 'Microsoft.OperationalInsights/workspaces@2023-09-01' = {
  name: workspaceName
  location: location

  sku: {
    name: 'PerGB2018'
  }

  properties: {
    retentionInDays: 30
  }
}

resource actionGroup 'Microsoft.Insights/actionGroups@2023-01-01' = {
  name: actionGroupName
  location: 'global'

  properties: {
    enabled: true
    groupShortName: 'LEXAG'

    emailReceivers: [
      {
        name: 'AdminEmail'
        emailAddress: emailAddress
        useCommonAlertSchema: true
      }
    ]
  }
}

resource highCpuAlert 'Microsoft.Insights/metricAlerts@2018-03-01' = {
  name: 'HighCPUAlert'
  location: 'global'

  properties: {
    severity: 2
    enabled: true

    scopes: [
      resourceGroup().id
    ]

    evaluationFrequency: 'PT5M'
    windowSize: 'PT15M'

    criteria: {
      allOf: [
        {
          criterionType: 'StaticThresholdCriterion'
          metricName: 'Percentage CPU'
          metricNamespace: 'Microsoft.Compute/virtualMachines'
          operator: 'GreaterThan'
          threshold: 80
          timeAggregation: 'Average'
        }
      ]
    }

    actions: [
      {
        actionGroupId: actionGroup.id
      }
    ]
  }
}

output workspaceId string = workspace.id
output workspaceName string = workspace.name
output actionGroupId string = actionGroup.id
output actionGroupName string = actionGroup.name
