# Cost Management Design

## Objective

The cost management strategy was designed to ensure that cloud resources were deployed in a financially efficient manner while still meeting the project's operational, security, monitoring, backup, and disaster recovery objectives. Cost optimization was considered throughout the design process to minimize unnecessary expenditure and support long-term sustainability of the environment.

## Cost Management Principles

#### The following principles guided the design:

- Deploy only resources required to satisfy project requirements.
- Utilize appropriately sized virtual machines.
- Prevent unnecessary resource duplication.
- Continuously monitor resource consumption.
- Leverage Azure-native cost management tools.
- Regularly review deployed resources for optimization opportunities.
- Minimize storage consumption through backup retention policies.


## Resource Cost Optimization

### Virtual Machine Sizing

The production workload was hosted on a single Windows Server virtual machine configured to provide sufficient compute resources while maintaining low operational costs.

#### Selected VM Size:

- Standard D2s V5
- 2 vCPUs
- 8 GB RAM

#### Justification:

- Suitable for medium to high workloads.
- Lower monthly operating cost than F-series alternatives.
- Meets project performance requirements without excessive resource allocation.

## Virtual Network Design

#### The network architecture was designed using:

- Single virtual network
- Segmented subnets
- Azure Bastion for secure management access

#### This approach reduced the need for:

- Additional public IP addresses
- VPN gateways
- Dedicated jump-box virtual machines

Resulting in lower infrastructure costs and a reduced attack surface.

## Azure Bastion Cost Considerations

#### Azure Bastion was selected because:

- Eliminates RDP exposure to the internet.
- Reduces security risk.
- Removes the need for a dedicated management VM.

Although Bastion incurs an additional cost, it simplifies administration and improves security posture.

## Backup Cost Management

### Recovery Services Vault

Azure Backup was configured through a Recovery Services Vault.

### Backup Policy

#### Setting |	Value
- Backup Frequency |	Daily
- Retention Period |	30 Days
- Storage Redundancy |	Locally Redundant Storage (LRS)
  
### Cost Optimization Measures
- Daily backups balanced recovery requirements with storage costs.
- LRS storage was selected instead of GRS to reduce backup storage charges.
- Retention periods were configured to avoid unnecessary long-term storage consumption.

## Monitoring Cost Management

### Log Analytics Workspace

Monitoring data is collected within a centralized Log Analytics Workspace.

### Configuration
#### Setting |	Value
- Retention Period |	30 Days
- Data Collection |	Security and operational logs
- Alerting	| Critical events only

### Cost Optimization Measures
- Retention limited to operational requirements.
- Excessive log collection avoided.
- Alert rules configured only for critical events.
- Unused diagnostic settings disabled.

## Security Cost Management

### Microsoft Defender for Cloud

Defender for Cloud recommendations were reviewed and implemented where supported.

### Design Considerations
- Free-tier recommendations leveraged where possible.
- Premium plans were only considered where additional security capabilities justified the cost.
- Security controls implemented using native Azure services to minimize third-party licensing requirements.

## Cost Monitoring and Reporting

Azure Cost Management and Billing was used to monitor cloud expenditure.

### Monitoring Activities
- Review current resource consumption.
- Identify underutilized resources.
- Track monthly spending trends.
- Forecast projected costs.
- Validate that resources remain within budget expectations.

### Cost Analysis Process
- Review monthly Azure spending.
- Identify highest-cost resources.
- Evaluate resource utilization.
- Right-size resources when necessary.
- Remove unused deployments and resource groups.
- Validate backup storage growth.

### Lifecycle Cost Optimization

During the implementation phase several cost control measures were adopted:

- Removal of unused test resources.
- Cleanup of redundant resource groups.
- Consolidation of monitoring services.
- Avoidance of duplicate infrastructure deployments.
- Use of Infrastructure as Code (Bicep) templates to ensure deployment consistency.

## Estimated High-Cost Services

The primary contributors to operational costs are:

#### Service |	Cost Impact
- Virtual Machine |	High
- Azure Bastion |	High
- Azure Backup Storage |	Medium
- Log Analytics Workspace |	Medium
- Key Vault |	Low
- Virtual Network |	Low
- Network Security Groups |	Negligible
  
## Design Outcome

The implemented cost management strategy ensures that the Azure environment remains financially sustainable while supporting business continuity, security, monitoring, and disaster recovery objectives. Continuous monitoring through Azure Cost Management enables proactive identification of cost optimization opportunities and supports efficient utilization of cloud resources.

### Key Benefits
- Controlled operational expenditure.
- Visibility into resource consumption.
- Scalable cost management framework.
- Efficient backup and monitoring retention policies.
- Reduced risk of unnecessary cloud spending.
- Alignment with Azure Well-Architected Framework cost optimization principles.

