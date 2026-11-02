# AZ-104 Azure Production Environment Project

## Overview

### This project demonstrates the design, deployment, and administration of a secure Azure production environment for a fictional organization.

### The objective was to showcase practical Azure Administrator (AZ-104) skills across core Azure services including:

- Networking
- Compute
- Storage
- Monitoring
- Backup & Recovery
- Governance
- Cost Management
- Security

---

## Solution Architecture

### The environment was deployed in Azure South Africa North and includes the following core components:

### Components include:

- Virtual Network
- Application Virtual Network
- Ubuntu Linux Virtual Machine
- Azure Bastion
- Network Security Group (NSG)
- Storage Account
- Log Analytics Workspace
- Recovery Services Vault
- Azure Key Vault
- Azure Policy
- RBAC
- Microsoft Defender for Cloud (Recommendations & Security Posture)

---

## Project Goals

- Deploy and secure Azure infrastructure
- Implement least-privilege administrative access
- Eliminate direct VM exposure to the internet
- Centralize monitoring and alerting
- Implement governance controls
- Validate disaster recovery readiness
- Infrastructure as Code using Bicep
- Demonstrate Azure operational best practices

---

## Architecture

./diagrams/architecture.png

---

## Folder Structure

```text
.
├── bicep
├── diagrams
├── documentation
|-- powershell
├── screenshots
└── README.md
'''
---

## Security Configuration:

### The following security controls were implemented:

- Azure Bastion for secure VM administration
- Removal of unnecessary inbound public access
- Network Security Group (NSG) controls
- Managed Identity
- RBAC
- Azure Policy with compliance controls
- Azure Key Vault with:
  - RBAC authorization enabled
  - Soft Delete enabled
  - Purge Protection enabled
- Microsoft Defender for Cloud recommendations reviewed
- Public IP exposure minimized where possible

---

## Backup Configuration

### Azure Backup was implemented using a Recovery Services Vault.

### Configuration:

- Azure VM protected by Recovery Services Vault
- Scheduled daily backups
- Backup retention policy configured
- Recovery points successfully created
- Backup jobs validated

### Recovery Testing:

- Recovery points verified
- Restore procedures documented
- Backup monitoring validated

### Disaster Recovery:
- A disaster recovery strategy was planned and partially validated.

### Completed:

- Secondary DR resource group created
- DR networking prepared
- Azure Site Recovery requirements assessed
- Replication configuration investigated
- Initial failover testing reviewed

### Limitation Encountered:

- A full Azure Site Recovery test failover could not be completed due to Azure subscription core quota limitations.

---

## Monitoring Configuration

### Monitoring was configured using:

- Log Analytics Workspace
- Azure Monitor
- Resource Health Alerts
- VM health monitoring
- Action Groups for alert notifications

## Alerting

### Configured alerts include:

- Resource Health alerts
- Virtual Machine availability monitoring
- Performance monitoring
- Backup monitoring validation

## Governance

### Azure Key Vault was deployed and secured with:

- RBAC-enabled permissions model
- Soft Delete enabled
- Purge Protection enabled
- Secret protection and centralized credential management


---

## Business Continuity Results

### Recovery Point Objective (RPO)

Backup frequency and recovery point creation were successfully validated through Azure Backup recovery points.

### Recovery Time Objective (RTO)

Restore processes were reviewed and documented. Full disaster recovery failover timing could not be formally validated due subscription resource constraints.

---

## Future Enhancements

- Azure DDoS Protection
- Azure Firewall
- Application Gateway
- Web Application Firewall (WAF)
- Microsoft Sentinel
- Privileged Identity Management (PIM)
- Virtual Network Peering

---

## Skills Demonstrated

- Azure Virtual Networking
- Azure Compute Administration
- Azure Storage Administration
- Azure Backup and Recovery
- Azure Monitoring and Alerting
- Azure Governance and Policy
- Azure Key Vault Administration
- Azure Security Best Practices
- RBAC Administration
- Disaster Recovery Planning
- Cost Optimization
- Infrastructure as Code deployment using Bicep 
- Azure CLI Operations

---

## Author

Alex Holdzinger

Event Management Engineer | Azure Administrator (AZ-104 Candidate)
