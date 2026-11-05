# Project Requirements

## 1. Purpose

- The purpose of this project is to design, implement, secure, monitor, and protect a production-ready cloud infrastructure within Microsoft Azure for LexCorp.
- The solution must provide secure workload hosting, centralized monitoring, backup capabilities, and disaster recovery functionality while adhering to cloud governance and cost management best practices.
- The project demonstrates the implementation of enterprise cloud architecture principles using Microsoft Azure services and Infrastructure as Code (IaC) methodologies.

## 2. Business Requirements

### The solution must meet the following business requirements:

#### Requirement ID	| Requirement	| Description
- BR-01	| High Availability	| Business services must remain available and resilient against localized failures.
- BR-02	| Disaster Recovery	| Critical workloads must be recoverable in the event of a regional outage.
- BR-03	| Secure Administration	| Administrative access must be secured and not exposed directly to the public internet.
- BR-04	| Data Protection	| Systems and application data must be protected against accidental loss, corruption, or deletion.
- BR-05	| Operational Visibility | Administrators must have visibility into system performance, health, and security events.
- BR-06	| Governance Compliance	| Resources must follow consistent naming standards and management practices.
- BR-07	| Cost Optimization	| The environment must be designed with cost management considerations suitable for a small-to-medium business.
- BR-08	| Scalability	| Infrastructure must support future expansion and additional workloads.
- BR-09	| Security	| Access to resources must follow the principle of least privilege.
- BR-10	| Automation	| Infrastructure deployments should leverage Infrastructure as Code where possible.

## 3. Project Scope

### In Scope

The following components are included within the project:

#### Compute
- Azure Virtual Machine
- ubuntu Linux Server workload hosting
#### Networking
- Virtual Network (VNet)
- Dedicated subnets
- Network Security Groups (NSGs)
- Private network communication
#### Security
- Azure Bastion
- Azure Key Vault
- Azure Role-Based Access Control (RBAC)
#### Monitoring
- Azure Monitor
- Log Analytics Workspace
- Performance and health monitoring
#### Backup and Recovery
- Azure Backup
- Recovery Services Vault
#### Disaster Recovery
- Azure Site Recovery (ASR)
- Cross-region replication
- Failover capability
#### Management and Governance
- Resource Groups
- Resource tagging
- Naming conventions
- Cost analysis
#### Automation
- Bicep templates
- Parameterized deployments

### Out of Scope

The following items are not included within this implementation:

- Azure Kubernetes Service (AKS)
- Azure Virtual Desktop
- Multi-subscription management
- Enterprise identity federation
- Azure Firewall deployment
- Azure Web Application Firewall (WAF)
- SIEM implementation using Microsoft Sentinel
- Production application deployment

## 4. Functional Requirements

### FR-01 Virtual Machine Deployment

A ubuntu Linux Server virtual machine must be deployed within Azure and act as the primary workload.

#### Acceptance Criteria
- VM successfully provisioned
- Accessible through Azure Bastion
- Protected by NSG rules
- Successfully backed up

### FR-02 Network Segmentation

A virtual network must be implemented with dedicated subnets.

#### Acceptance Criteria
- VNet successfully deployed
- Subnets configured correctly
- NSGs applied
- Resources communicate internally

### FR-03 Secure Remote Administration

Administrative access must not rely on public RDP exposure.

#### Acceptance Criteria
- Azure Bastion deployed
- RDP port not publicly exposed
- Successful management connection established

### FR-04 Monitoring Solution

Infrastructure monitoring must be implemented.

#### Acceptance Criteria
- Log Analytics Workspace deployed
- Azure Monitor configured
- VM reporting performance metrics
- Activity logs collected

### FR-05 Secret Management

Sensitive information must be stored securely.

#### Acceptance Criteria
- Azure Key Vault deployed
- RBAC enabled
- Soft Delete enabled
- Purge Protection enabled

### FR-06 Backup Protection

Workloads must be protected using Azure Backup.

#### Acceptance Criteria
- Recovery Services Vault deployed
- Backup policy configured
- Successful backup completion
- Recovery point creation verified

### FR-07 Disaster Recovery

The solution must support workload recovery in a secondary Azure region.

#### Acceptance Criteria
- Azure Site Recovery configured
- Replication healthy
- Initial failover completed successfully
- Failover process documented

### FR-08 Infrastructure as Code

Core infrastructure components must be deployable through Bicep templates.

#### Acceptance Criteria
- Main deployment template created
- Modules structured logically
- Parameter file included
- Validation successful

# 5. Non-Functional Requirements
### Availability
#### Requirement	| Target
- VM Availability	| 99.9% or higher
- Backup Availability	| Azure managed service SLA
- Monitoring Availability	Continuous collection

### Performance
#### Requirement | Target
- Monitoring Data Collection	| Near Real-Time
- Backup Execution	| Daily Schedule
- Replication Health	| Continuous

### Scalability

The environment must support:

- Additional virtual machines
- Additional subnets
- Additional backup workloads
- Additional monitored resources

without requiring major redesign.

### Security

The solution must:

- Follow the Principle of Least Privilege
- Use Azure RBAC
- Eliminate public RDP exposure
- Protect secrets using Key Vault
- Utilize NSGs to limit network access
- Maintainability

The environment must be easy to manage through:

- Centralized monitoring
- Standardized naming conventions
- Documentation
- Automation using Bicep

# 6. Disaster Recovery Requirements

#### Requirement	| Objective
- Recovery Point Objective (RPO)	| Less than 15 minutes
- Recovery Time Objective (RTO)	| Less than 4 hours
- Replication	| Continuous replication to secondary region
- Test Failover	| Validate recovery procedures
- Planned Failover	| Support manual disaster recovery operations

# 7. Security Requirements

The following controls must be implemented:

#### Control Area	| Requirement
- Identity Management	|Azure RBAC
- Administrative Access	|Azure Bastion
- Secret Management	|Azure Key Vault
- Network Security	|NSGs
- Monitoring	|Azure Monitor
- Data Protection	|Azure Backup
- Recovery	| Azure Site Recovery

#8. Governance Requirements

The following governance standards shall be followed:

## Resource Naming Convention

All resources shall follow the naming format:
```
<resource-type>-lexcorp-prod
```
Examples:

- vm-lexcorp-prod
- vnet-lexcorp-prod
- kv-lexcorp-prod
- law-lexcorp-prod
- rsv-lexcorp-prod
- Resource Tagging

#### Tag	| Example
- Environment	| Production
- Project	| LexCorp DR Project
- Owner	| Alex Holdzinger
- CostCenter	| IT Operations
  
# 9. Cost Management Requirements

The solution must:

- Use appropriately sized resources
- Track Azure consumption
- Monitor ongoing costs
- Avoid unnecessary premium services
- Support budget reporting

Cost optimization must balance business continuity requirements with financial constraints.

# 10. Assumptions

The following assumptions apply:

- Microsoft Azure is the selected cloud platform.
- Azure regional services remain available according to published Microsoft SLAs.
- The environment is intended for demonstration and portfolio purposes.
- One primary virtual machine is sufficient for project scope.
- Administrative access is limited to authorized personnel.

# 11. Project Success Criteria

The project will be considered successful when:

✅ Core Azure infrastructure is deployed successfully.

✅ Secure administrative access is established through Azure Bastion.

✅ Azure Monitor and Log Analytics collect operational data.

✅ Azure Backup creates successful recovery points.

✅ Azure Site Recovery replicates workloads and supports failover.

✅ Azure Key Vault securely stores sensitive information.

✅ Infrastructure deployment is documented through Bicep templates.

✅ Operational and implementation documentation is completed.

✅ Validation evidence and screenshots confirm successful deployment and functionality.
