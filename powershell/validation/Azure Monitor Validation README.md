# Azure Monitor Validation

## Objective

Verify monitoring and alerting functionality.

## Validation Command

Get-AzScheduledQueryRule `
    -ResourceGroupName "RG-LexCorp-Prod"

## or

Get-AzMetricAlertRuleV2 `
    -ResourceGroupName "RG-LexCorp-Prod"

## Portal Validation

Navigate to:

- Azure Monitor
- → Alerts
- → Alert Rules

Confirm:

- Alert rules enabled
- Correct scope configured
- Action Group attached
- Alert Validation

Trigger a test alert where possible and verify:

- Alert activates
- Action Group receives notification

## Validation Successful
