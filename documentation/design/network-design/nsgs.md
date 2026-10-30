# Network Security Groups

## NSG-AppSubnet

Inbound Rules

Priority: 100
Name: Allow-Bastion-SSH
Port: 22
Source: AzureBastionSubnet
Action: Allow

Priority: 200
Name: Deny-Internet-Inbound
Action: Deny
