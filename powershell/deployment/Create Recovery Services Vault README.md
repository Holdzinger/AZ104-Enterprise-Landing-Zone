New-AzRecoveryServicesVault `
    -Name "rsv-lexcorp-prod" `
    -ResourceGroupName "RG-LexCorp-Prod" `
    -Location "South Africa North"

    Set Vault Context:
  
$vault = Get-AzRecoveryServicesVault `
    -Name "rsv-lexcorp-prod"

Set-AzRecoveryServicesVaultContext `
    -Vault $vault
