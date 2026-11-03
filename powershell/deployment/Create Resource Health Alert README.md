$actionGroup = Get-AzActionGroup `
    -ResourceGroupName "RG-LexCorp-Prod" `
    -Name "ag-lexcorp-prod"

Add-AzMetricAlertRuleV2 `
    -Name "VM-Health-Alert" `
    -ResourceGroupName "RG-LexCorp-Prod" `
    -TargetResourceScope "/subscriptions/<subscription-id>/resourceGroups/RG-LexCorp-Prod/providers/Microsoft.Compute/virtualMachines/vm-lexcorp-app01" `
    -WindowSize (New-TimeSpan -Minutes 5) `
    -Frequency (New-TimeSpan -Minutes 5) `
    -Severity 2 `
    -ActionGroupId $actionGroup.Id
