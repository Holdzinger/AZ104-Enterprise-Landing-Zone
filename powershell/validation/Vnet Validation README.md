# Virtual Network Validation

## Objective

Confirm the VNet and subnet configuration were created correctly.

## Validation Command

Get-AzVirtualNetwork `
    -Name "vnet-lexcorp-prod" `
    -ResourceGroupName "RG-LexCorp-Prod"
    
## Result

- Address Space: 10.0.0.0/16
- Subnet: default
- Subnet: AzureBastionSubnet

## Portal Validation

Navigate to Virtual Networks
Verify:
- Address space configured
- Subnets present
- NSG associated where applicable

## Validation Successful
