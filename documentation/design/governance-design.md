# Governance Design

## Objective

The governance design ensures that the Azure environment is managed securely, consistently, and in alignment with organizational and operational requirements. Governance controls were implemented to support resource organization, access management, compliance monitoring, cost visibility, and operational accountability.

## Resource Organization

Resources were grouped logically using Azure Resource Groups to simplify administration, access control, monitoring, and lifecycle management.

### Resource Group Structure
#### Resource Group |	Purpose
- RG-LexCorp-Prod	| Production infrastructure resources
- Default Resources (where applicable) |	Azure-managed service resources

This structure allows resources to be managed collectively while maintaining clear separation of workloads.

## Naming Standards

A standardized naming convention was adopted to improve resource identification and maintain consistency across the environment.

### Naming Convention
- resource-type-organization-environment

### Examples

- vnet-lexcorp-prod
- vm-lexcorp-app01
- kv-lexcorp-prod
- law-lexcorp-prod
- rsv-lexcorp-prod

#### Benefits include:

- Simplified resource discovery
- Easier troubleshooting
- Improved operational management
- Consistent documentation

## Role-Based Access Control (RBAC)

Azure RBAC was used to implement the principle of least privilege.

### Assigned Permissions
#### Role |	Purpose
- Owner	| Subscription administration
- Contributor |	Resource management
- Reader	| Monitoring and reporting
- Key Vault Administrator	| Secret and certificate management

RBAC ensures users receive only the permissions required to perform their assigned tasks.

## Privileged Identity Management (PIM)

Azure Entra ID Privileged Identity Management was assessed but not implemented within the project scope.

### Justification
- Environment contains only a small number of administrative accounts.
- No shared administrative access requirements existed.
- RBAC controls adequately met project requirements.
- PIM would be recommended for enterprise production deployments due to its Just-In-Time (JIT) access capabilities.

## Tagging Strategy

Resource tagging was defined to improve resource tracking, reporting, and future cost management.

### Standard Tags
#### Tag |	Value
- Environment |	Production
- Project	| LexCorp Infrastructure Project
- Owner |	Alex Holdzinger
- Department |	IT Infrastructure

#### Example:

- Environment = Production
- Project = LexCorp Infrastructure
- Owner = Alex Holdzinger

#### Benefits:

- Simplified cost allocation
- Improved inventory management
- Better governance reporting

 ## Security Governance

Security governance controls were established through Azure native services.

### Implemented Controls
- Microsoft Defender for Cloud enabled for security posture management.
- Key Vault configured with:
  - RBAC authorization
  - Soft Delete enabled
  - Purge Protection enabled
- Azure Backup configured for business continuity.
- Network Security Groups used to restrict traffic flows.
- Private Endpoint implemented to eliminate public access to Key Vault.

These controls align with Azure security best practices and provide layered protection against unauthorized access and accidental data loss.

## Cost Management Governance

Cost governance was implemented using Azure Cost Management and budgeting capabilities.

### Monitoring Activities
- Regular review of subscription costs.
- Resource sizing aligned with workload requirements.
- Unused resources identified and removed when appropriate.
- Cost analysis performed using Azure Cost Management.

### Future Improvements
- Configure budget alerts.
- Enable automated cost anomaly detection.
- Introduce chargeback/showback reporting through tagging.

## Compliance and Monitoring Governance

Operational governance was supported through centralized monitoring and reporting.

### Governance Monitoring Components
#### Service |	Function
- Azure Monitor	| Performance and availability monitoring
- Log Analytics Workspace	| Centralized log collection
- Recovery Services Vault	| Backup monitoring and reporting
- Defender for Cloud	| Security recommendations and compliance tracking

#### Governance reviews should be conducted periodically to ensure:

- Backup success rates remain acceptable.
- Security recommendations are remediated.
- Resource configurations remain compliant.
- Monitoring alerts remain functional.

## Governance Validation

The governance design was validated through the following checks:

#### Validation Item |	Result
- RBAC Configuration |	Successful
- Key Vault Security Controls |	Successful
- Backup Monitoring |	Successful
- Azure Monitor Alerts |	Successful
- Defender for Cloud Recommendations Reviewed |	Successful
- Resource Naming Consistency |	Successful

## Design Summary

- The governance framework provides operational oversight through resource standardization, role-based access control, security governance, monitoring, backup management, and cost management practices. 
- While advanced governance features such as Azure Policy and Privileged Identity Management were outside the scope of this implementation, the deployed controls establish a secure and manageable foundation that aligns with Azure governance best practices for a small-to-medium production environment.
