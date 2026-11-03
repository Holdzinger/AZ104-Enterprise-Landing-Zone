# Network Security Groups (NSG)

### An NSG was implemented to control inbound and outbound traffic at the subnet level.

## Security Objectives

- Restrict administrative access.
- Block unnecessary inbound traffic.
- Apply the principle of least privilege.
- Protect virtual machines from unauthorized network access.
  
## Key Rules

### Priority |	Direction |	Action |	Source |	Destination |	Purpose
- 100 |	Inbound |	Allow |	Azure Bastion |	Application Subnet |	Secure RDP management
- 200	| Inbound |	Deny |	Internet |	Application Subnet |	Block direct public access
- Default	| Inbound |	Deny |	Any	| Any |	Block unauthorized traffic
- Default	| Outbound |	Allow |	Application Subnet |	Internet/Azure Services |	Enable required service communication

## Security Benefits

- No public RDP access exposed to the internet.
- Administrative access is routed through Azure Bastion.
- Network isolation reduces attack surface.
- Supports Microsoft Azure security best practices.

## Network Architecture Overview

### Internet

      ▼
### Azure Bastion(10.0.2.0/26)

      ▼
### Application Subnet(10.0.1.0/24)

      ▼
### VM-Lexcorp-App01

      ▼
### Private Endpoint Subnet(10.0.3.0/24)

      ▼
### Azure Key Vault
 
## Outcome

The network design provides secure administrative access, private service connectivity, and logical segmentation of resources. The architecture supports the project's objectives of security, business continuity, disaster recovery, and compliance with Azure cloud architecture best practices.
