# Network Ranges

### The solution was deployed within a dedicated Azure Virtual Network (VNet) to provide network isolation and support secure communication between resources.

### Component	and Address Space

- Virtual Network (vnet-lexcorp-prod)	10.0.0.0/16
- Application Subnet	10.0.1.0/24
- Azure Bastion Subnet	10.0.2.0/26
- Private Endpoint Subnet	10.0.3.0/24

## Design Considerations

- A private IP addressing scheme was used to prevent direct internet exposure of workloads.
- Separate subnets were implemented to enforce segregation of duties and simplify security management.
- Sufficient address space was allocated to accommodate future scaling requirements.
- The VNet serves as the foundation for backup, disaster recovery replication, and secure administrative access.
