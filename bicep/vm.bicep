targetScope = 'resourceGroup'

param location string
param subnetId string
param vmName string


resource nic 'Microsoft.Network/networkInterfaces@2023-09-01' = {
  name: 'nic-lexcorp-app01'
  location: location

  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'

        properties: {
          privateIPAllocationMethod: 'Dynamic'

          subnet: {
            id: subnetId
          }
        }
      }
    ]
  }
}

resource vm 'Microsoft.Compute/virtualMachines@2023-09-01' = {
  name: vmName
  location: location

  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B2s'
    }

    osProfile: {
      computerName: vmName
      adminUsername: 'azureadmin'
      adminPassword: 'ChangeThisPassword123!'
    }

    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: '2022-datacenter-azure-edition'
        version: 'latest'
      }

      osDisk: {
        createOption: 'FromImage'
      }
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

