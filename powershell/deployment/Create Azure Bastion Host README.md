New-AzBastion `
    -ResourceGroupName "RG-LexCorp-Prod" `
    -Name "bas-lexcorp-prod" `
    -PublicIpAddressRgName "RG-LexCorp-Prod" `
    -PublicIpAddressName "pip-bastion-prod" `
    -VirtualNetworkRgName "RG-LexCorp-Prod" `
    -VirtualNetworkName "vnet-lexcorp-prod"
