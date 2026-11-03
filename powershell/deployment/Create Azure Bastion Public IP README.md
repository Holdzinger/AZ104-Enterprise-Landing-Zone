New-AzPublicIpAddress `
    -Name "pip-bastion-prod" `
    -ResourceGroupName "RG-LexCorp-Prod" `
    -Location "South Africa North" `
    -Sku Standard `
    -AllocationMethod Static
