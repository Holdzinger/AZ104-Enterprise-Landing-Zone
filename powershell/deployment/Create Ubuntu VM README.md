$cred = Get-Credential

New-AzVm `
    -ResourceGroupName "RG-LexCorp-Prod" `
    -Name "vm-lexcorp-app01" `
    -Location "South Africa North" `
    -VirtualNetworkName "vnet-lexcorp-prod" `
    -SubnetName "default" `
    -SecurityGroupName "nsg-lexcorp-prod" `
    -Image "Ubuntu2204" `
    -Size "Standard_B2s" `
    -Credential $cred
