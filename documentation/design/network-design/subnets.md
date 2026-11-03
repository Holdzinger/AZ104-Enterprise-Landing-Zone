# Subnet Design

## Application Subnet

Subnet: 10.0.1.0/24

### Hosts:

- Production virtual machine (VM-Lexcorp-App01)
- Future application resources if required

### Purpose:

- Hosts production workloads.
- Protected through Network Security Group (NSG) rules.
- Access is restricted to approved management sources.

## Azure Bastion Subnet

Subnet: 10.0.2.0/26

### Hosts:

- Azure Bastion Service

### Purpose:

- Provides secure RDP connectivity without exposing the VM to the public internet.
- Eliminates the requirement for a public IP address on the production VM.
- Enforces a Zero Trust approach to administrative access.

## Private Endpoint Subnet

Subnet: 10.0.3.0/24

### Hosts:

- Private Endpoints

### Purpose:

- Enables Azure services such as Key Vault to be accessed privately over the Microsoft backbone network.
- Prevents exposure of sensitive services to public networks.
- Supports compliance and security best practices.
