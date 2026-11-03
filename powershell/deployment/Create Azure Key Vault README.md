New-AzKeyVault `
    -VaultName "kv-lexcorp-prod" `
    -ResourceGroupName "RG-LexCorp-Prod" `
    -Location "South Africa North" `
    -EnablePurgeProtection `
    -EnableRbacAuthorization
