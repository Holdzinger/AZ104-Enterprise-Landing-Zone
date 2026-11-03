$policy = Get-AzRecoveryServicesBackupProtectionPolicy `
    -Name "DefaultPolicy"

Enable-AzRecoveryServicesBackupProtection `
    -Policy $policy `
    -Name "vm-lexcorp-app01" `
    -ResourceGroupName "RG-LexCorp-Prod"
