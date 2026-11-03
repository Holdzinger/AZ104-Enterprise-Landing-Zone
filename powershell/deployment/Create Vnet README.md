$subnet = New-AzVirtualNetworkSubnetConfig `
    -Name "default" `
    -AddressPrefix "10.0.1.0/24"

New-AzVirtualNetwork `
    -Name "vnet-lexcorp-prod" `
    -ResourceGroupName "RG-LexCorp-Prod" `
    -Location "South Africa North" `
    -AddressPrefix "10.0.0.0/16" `
    -Subnet $subnet
