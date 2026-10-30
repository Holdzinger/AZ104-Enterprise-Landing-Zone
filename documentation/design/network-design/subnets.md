## Hub VNet 10.0.0.0/16

Purpose:

Shared services
Administrative access
Future VPN/ExpressRoute integration

### Subnets:

AzureBastionSubnet
10.0.1.0/24

ManagementSubnet
10.0.2.0/24

## App VNet 10.1.0.0/16

Resources:

Linux VM
Future Application Services

### Subnets:

AppSubnet
10.1.1.0/24

## Data VNet 10.2.0.0/16

Resources:

Storage Account
Azure Files
Backup Services

### Subnets:

DataSubnet
10.2.1.0/24
