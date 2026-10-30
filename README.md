# AZ104 Enterprise Landing Zone

## Overview

This project demonstrates the design and deployment of a production-ready Azure Landing Zone for a fictional 100-user organization.

The objective was to showcase practical Azure Administrator (AZ-104) skills including:

- Networking
- Compute
- Storage
- Monitoring
- Backup
- Governance
- Cost Management
- Security

---

## Solution Architecture

The environment is built using a Hub-and-Spoke architecture.

Components include:

- Hub Virtual Network
- Application Virtual Network
- Data Virtual Network
- Ubuntu Virtual Machine
- Storage Account
- Azure Monitor
- Log Analytics Workspace
- Recovery Services Vault
- Azure Bastion
- Azure Policy
- RBAC

---

## Project Goals

- Secure remote administration
- Centralized monitoring
- Backup and disaster recovery
- Governance through policy
- Cost optimization
- Infrastructure as Code using Bicep

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
```

---

## Deployment

Create Resource Group:

```powershell
az group create `
 --name rg-lexcorp-prod `
 --location southafricanorth
```

Deploy Environment:

```powershell
az deployment group create `
 --resource-group rg-lexcorp-prod `
 --template-file main.bicep `
 --parameters parameters.json
```

---

## Security Features

- Azure Bastion
- NSGs
- Managed Identity
- RBAC
- Azure Policy
- Storage Public Access Disabled
- TLS 1.2 Enforcement

---

## Backup Configuration

- Recovery Services Vault
- Daily Backups
- 30-Day Retention

---

## Monitoring Configuration

- Log Analytics Workspace
- Azure Monitor
- Resource Health Alerts
- Performance Alerts

---

## Business Continuity

### RTO

4 Hours

### RPO

1 Hour

---

## Future Enhancements

- ExpressRoute Connectivity
- Azure Firewall
- Application Gateway
- Availability Zones
- Azure Site Recovery
- Defender for Cloud
- Sentinel

---

## Skills Demonstrated

- Azure Networking
- Azure Compute
- Azure Storage
- Azure Monitoring
- Azure Governance
- Infrastructure as Code
- Disaster Recovery Planning
- Cost Optimization

---

## Author

Alex Holdzinger

Event Management Engineer | Azure Administrator (AZ-104 Candidate)
