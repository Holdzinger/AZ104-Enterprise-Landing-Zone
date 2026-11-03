$vnet = Get-AzVirtualNetwork `
    -Name "vnet-lexcorp-prod" `
    -ResourceGroupName "RG-LexCorp-Prod"

Add-AzVirtualNetworkSubnetConfig `
    -Name "AzureBastionSubnet" `
    -AddressPrefix "10.0.2.0/26" `
    -VirtualNetwork $vnet

$vnet | Set-AzVirtualNetwork
