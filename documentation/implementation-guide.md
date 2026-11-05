# Implementation Guide

## Azure Secure Workload Protection and Disaster Recovery Solution for LexCorp

Project Name: LexCorp Production Environment Deployment
- Author: Alex Holdzinger
- Environment: Microsoft Azure
- Purpose: Deploy a secure, monitored, backed-up, and recoverable Azure infrastructure aligned to business continuity and security best practices.

# 1. Project Overview

This implementation guide documents the deployment and configuration of the Azure production environment for LexCorp. The solution provides:

- Secure network architecture
- Virtual machine hosting
- Identity and access control
- Backup and disaster recovery
- Security monitoring
- Operational monitoring and alerting
- Cost management and governance

## Objectives

- Deploy a production-ready virtual machine environment
- Protect workloads through Azure Backup
- Enable disaster recovery capabilities
- Secure resources using private networking and Key Vault
- Implement centralized monitoring and alerting
- Reduce operational risk through governance controls

# 2. Prerequisites

## Azure Resources Required

### Resource	| Purpose

- Resource Group	| Resource organization
- Virtual Network	| Network segmentation
- Subnets	| Workload isolation
- NSGs	| Traffic filtering
- Virtual Machine	| Application hosting
- Azure Bastion	| Secure management access
- Recovery Services Vault	| Backup protection
- Log Analytics Workspace	| Monitoring and logging
- Azure Monitor	| Alerting and visualization
- Key Vault	| Secret management

## Required Permissions

The implementation account must have:

- Contributor
- Backup Contributor
- Security Admin
- Monitoring Contributor

# 3. Deployment Architecture
``` Plain Text
Internet
│
▼
Azure Bastion
│
▼
Virtual Network (10.0.0.0/16)
│
├── AzureBastionSubnet
│ └── 10.0.0.0/26
│
├── ProductionSubnet
│ └── 10.0.1.0/24
│
├── PrivateEndpointSubnet
│ └── 10.0.2.0/24
│
└── ManagementSubnet
└── 10.0.3.0/24
 
│
▼
Virtual Machine
 
│
▼
Recovery Services Vault
 
│
▼
Log Analytics Workspace
 
│
▼
Azure Monitor
 
│
▼
Key Vault
```

# 4. Resource Deployment

## Step 1: Create Resource Group

### Portal

#### Navigate to:

- Azure Portal → Resource Groups


#### Select:

- Create


#### Configure:

- Setting	| Value
- Subscription	| Azure Subscription
- Resource Group	| RG-LexCorp-Prod
- Region	| South Africa North

#### Click:

- Review + Create

## Step 2: Deploy Virtual Network

### Configuration

#### Property	| Value

- Name	| vnet-lexcorp-prod
- Address Space	| 10.0.0.0/16
  
### Subnets

#### Subnet	| Range 

- AzureBastionSubnet	| 10.0.0.0/26
- ProductionSubnet	| 10.0.1.0/24
- PrivateEndpointSubnet	| 10.0.2.0/24
- ManagementSubnet	| 10.0.3.0/24


## Step 3: Configure NSGs

### Production NSG Rules

#### Priority	| Rule	| Port	| Action

- 100	| Allow-Bastion-RDP	| 3389	| Allow
- 110	| Allow-Bastion-SSH	| 22	| Allow
- 4096	| Deny-All-Inbound	| *	Deny

## Outbound Rules

#### Priority	| Rule	| Action

- Default	| Allow Internet	| Allow

  
## Step 4: Deploy Azure Bastion

### Settings

#### Property	| Value

- Name	| bastion-lexcorp-prod
- SKU	| Basic
- Subnet	| AzureBastionSubnet
- Public IP	| pip-bastion-prod
  
### Validation

Confirm successful connection to VM without:

- Public IP assignment
- RDP exposure
- SSH exposure


## Step 5: Deploy Virtual Machine

### Specifications

#### Property	| Value

- Name	| vm-lexcorp-app01
- OS	| ubuntu Linux
- Size	| D2s V5
- Public IP	| None
- Subnet	|ProductionSubnet
- Backup	| Enabled

### Security Settings

- Trusted Launch enabled
- Secure Boot enabled
- vTPM enabled

# 5. Backup Implementation

## Step 6: Create Recovery Services Vault

#### Property	| Value
- Name	| rsv-lexcorp-prod
- Region	| South Africa North
  
## Step 7: Configure Backup Policy

### Daily Backup

#### Setting	| Value
- Frequency	| Daily
- Time	| 23:00
- Retention	| 30 Days
  
### Backup Validation

Verify:

- Successful backup jobs
- Recovery point creation
- Backup alerts

## Step 8: Restore Validation

- Test Restore Procedure
- Open Vault.
- Select Protected Items.
- Choose VM.
- Select Recovery Point.
- Start Restore.
  
### Record Results

#### Item	| Result

- Backup Success	| Pass
- Restore Success	| Pass
- Recovery Point Created	| Pass

# 6. Security Implementation

## Step 9: Deploy Azure Key Vault

### Configuration

#### Property	| Value

- Name	| kv-lexcorp-prod
- Soft Delete	| Enabled
- Purge Protection	| Enabled
- Public Access	| Disabled

### Secrets Stored

- Local Administrator Passwords
- Service Credentials
- Application Secrets

## Step 10: Microsoft Defender for Cloud

### Enable Plans

- Defender for Servers
- Defender for Storage (optional)
- Defender CSPM
  
### Actions

#### Review and remediate:

- Security recommendations
- Vulnerability findings
- Hardening recommendations
  
# 7. Monitoring Implementation

## Step 11: Deploy Log Analytics Workspace

#### Property	| Value

- Name	| law-lexcorp-prod
- Retention	| 30 Days
  
## Step 12: Configure Azure Monitor

#### Connect:

- Virtual Machine
- Recovery Services Vault
- Key Vault
- Network Resources

## Step 13: Create Action Group

### Notification Method

#### Type	| Value

- Email	| Project Administrator

  
## Step 14: Configure Alert Rules

### VM Health Alerts

##### Alert	| Severity

- CPU > 80%	| Sev 2
- Memory Utilization	| Sev 2
- VM Unavailable	| Sev 1
  
### Backup Alerts

#### Alert	| Severity

- Backup Failure	| Sev 1
- Restore Failure	| Sev 1
- Backup Warning	| Sev 2

### Security Alerts

#### Alert	|Severity

- Defender Recommendation	| Sev 3
- Security Event Detected	| Sev 1
  
# 8. Disaster Recovery Testing

## Step 15: DR Validation

### Test 1: Backup Restore

#### Objective: Restore VM from latest recovery point.

#### Expected Result: VM restored successfully.

### Test 2: Recovery Validation

#### Objective: Verify workload functionality after restore.

#### Expected Result:

- Services operational
- User access available
- Application healthy
  
### RPO and RTO Results

#### Metric	Target	| Actual

- RPO	24 Hours	| 24 Hours
- RTO	4 Hours	| Actual failover/restore result

Note: Due to subscription core limitations, a complete failover test could not be executed. Initial recovery testing and recovery point validation were successfully completed.

# 9. Governance and Cost Management

## Resource Tagging

### Apply tags:

#### Tag	| Example

- Environment	| Production
- Owner	| Alex Holdzinger
- Project	| LexCorp
- CostCenter	| Infrastructure
- Azure | Budget

### Configure:

- Monthly Budget
- 80% Alert
- 100% Alert

Monitor:

``` Plain Text
Cost Management
└── Budgets
```

# 10. Validation Checklist

## Infrastructure

- Resource Group deployed
- VNet and subnets created
- NSGs configured
- Bastion deployed
- VM deployed
## Backup
- Recovery Services Vault created
- Backup policy configured
- Backup successful
- Restore validated
## Security
- Key Vault configured
- Defender for Cloud enabled
- Security recommendations reviewed
## Monitoring
- Log Analytics configured
- Azure Monitor connected
- Action Group created
- Alert Rules configured
## Governance
- Tags applied
- Budget created
- Cost monitoring enabled

# 11. Conclusion

- The LexCorp Azure environment was successfully implemented using Microsoft Azure services to provide a secure, monitored, and resilient production platform. 
- The deployment incorporates network isolation, secure administration through Azure Bastion, workload protection via Azure Backup, 
- centralized monitoring, security visibility through Microsoft Defender for Cloud, and governance controls to support long-term operational management and business continuity objectives.
