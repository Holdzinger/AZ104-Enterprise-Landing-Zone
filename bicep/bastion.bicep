targetScope = 'resourceGroup'

param bastionName string
param publicIpName string
param location string
param vnetName string


resource publicIp 'Microsoft.Network/publicIPAddresses@2023-09-01' = {
  name: publicIpName
  location: location

  sku: {
    name: 'Standard'
  }

  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

resource vnet 'Microsoft.Network/virtualNetworks@2023-09-01' existing = {
  name: vnetName
}

resource bastionHost 'Microsoft.Network/bastionHosts@2023-09-01' = {
  name: bastionName
  location: location

  properties: {
    ipConfigurations: [
      {
        name: 'bastion-ipconfig'

        properties: {
          subnet: {
            id: '${vnet.id}/subnets/AzureBastionSubnet'
          }

          publicIPAddress: {
            id: publicIp.id
          }
        }
      }
    ]
  }
}
