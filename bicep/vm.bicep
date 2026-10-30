param location string
param subnetId string
param adminUsername string

@secure()
param adminPassword string

resource publicIp 'Microsoft.Network/publicIPAddresses@2023-09-01' = {
  name: 'vm-public-ip'
  location: location

  sku: {
    name: 'Standard'
  }

  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

resource nic 'Microsoft.Network/networkInterfaces@2023-09-01' = {
  name: 'vm-nic'
  location: location

  properties: {
    ipConfigurations: [
      {
        name: 'internal'
        properties: {
          subnet: {
            id: subnetId
          }

          privateIPAllocationMethod: 'Dynamic'

          publicIPAddress: {
            id: publicIp.id
          }
        }
      }
    ]
  }
}

resource vm 'Microsoft.Compute/virtualMachines@2024-03-01' = {
  name: 'vm-lexcorp-app01'
  location: location

  properties: {
    hardwareProfile: {
      vmSize: 'Standard_D2s_v5'
    }

    storageProfile: {
      imageReference: {
        publisher: 'Canonical'
        offer: '0001-com-ubuntu-server-jammy'
        sku: '22_04-lts-gen2'
        version: 'latest'
      }

      osDisk: {
        createOption: 'FromImage'
      }
    }

    osProfile: {
      computerName: 'app01'
      adminUsername: adminUsername
      adminPassword: adminPassword
    }

    networkProfile: {
      networkInterfaces: [
        {
          id: nic.id
        }
      ]
    }
  }
}

