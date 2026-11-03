targetScope = 'resourceGroup'

param vnetName string
param subnetName string
param nsgName string
param location string = resourceGroup().location

resource vnet 'Microsoft.Network/virtualNetworks@2023-09-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.1.0.0/16'
      ]
    }

    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: '10.1.1.0/24'
        }
      }
    ]
  }
}

resource nsg 'Microsoft.Network/networkSecurityGroups@2023-09-01' = {
  name: nsgName
  location: location

  properties: {
    securityRules: [
      {
        name: 'AllowSSH'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '22'
          access: 'Allow'
          priority: 100
          direction: 'Inbound'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
        }
      }
    ]
  }
}

{
  name: 'AzureBastionSubnet'
  properties: {
    addressPrefix: '10.1.2.0/26'
  }
}
output subnetId string = resourceId('Microsoft.Network/virtualNetworks/subnets', vnet.name, 'app-subnet')

