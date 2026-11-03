# Log Analytics Workspace Validation

## Objective

Confirm the workspace is deployed and receiving data.

## Validation Command

Get-AzOperationalInsightsWorkspace `
    -ResourceGroupName "RG-LexCorp-Prod" `
    -Name "law-lexcorp-prod"

## Result

- ProvisioningState : Succeeded

## Portal Validation

- Navigate to

  - Log Analytics Workspace
  - → Logs

- Run (KQL)

  - Heartbeat
    | take 10

## Result

- Heartbeat records from the VM are returned.

## Validation Successful
