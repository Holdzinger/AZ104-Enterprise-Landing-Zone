# Backup and Disaster Recovery (DR) Plan Design

## Overview

The Backup and Disaster Recovery strategy was designed to ensure business continuity, data protection, and rapid recovery of critical services hosted within the Azure environment. The solution leverages Azure Backup and Azure Site Recovery (ASR) to provide protection against accidental deletion, data corruption, system failure, and regional outages.

## Objectives

### The Backup and DR design was implemented to achieve the following objectives:

- Protect critical workloads and application data.
- Minimize service downtime during disruption events.
- Provide reliable recovery options for operational incidents.
- Meet Recovery Point Objective (RPO) and Recovery Time Objective (RTO) requirements.
- Ensure recoverability through regular validation and monitoring.

## Backup Design

### Backup Solution

Azure Backup was configured through the Recovery Services Vault to provide centralized backup management for protected virtual machines.

## Backup Configuration
#### Component |	Configuration
Backup Service |	Azure Backup
Recovery Services Vault |	rsv-lexcorp-prod
Protected Resource |	VM-lexcorp-app01
Backup Type |	Azure VM Backup
Backup Frequency |	Daily
Retention Period |	30 Days
Storage Redundancy |	Locally Redundant Storage (LRS)
Management Platform |	Recovery Services Vault

## Backup Process
- Scheduled backups are triggered automatically according to the backup policy.
- Recovery points are created and stored within the Recovery Services Vault.
- Backup jobs are monitored through Azure Backup Center and Azure Monitor.
- Recovery points can be used to restore the entire VM or individual disks when required.

### Backup Monitoring

#### Backup operations are continuously monitored using:

- Azure Monitor
- Recovery Services Vault Backup Reports
- Action Groups for alert notifications
- Log Analytics Workspace integration

Configured monitoring ensures that backup failures or warnings can be identified and remediated promptly.

## Disaster Recovery Design

### DR Solution

Azure Site Recovery (ASR) was implemented to replicate production workloads from the primary region to a secondary Azure region.

#### Site Recovery Configuration

#### Component |	Configuration
Replication Technology |	Azure Site Recovery
Source Region |	South Africa North
Target Region |	East US
Protected Workload |	VM-lexcorp-app01
Replication Type |	Azure-to-Azure
Failover Type |	Planned, Test, and Unplanned
Recovery Services Vault |	rsv-lexcorp-prod

### Replication Process

- Azure Site Recovery continuously replicates changes from the production VM.
- Replicated data is stored securely in the target region.
- Recovery points are automatically generated based on the replication policy.
- In the event of a disaster, failover can be initiated to the secondary region.
- Once the primary environment becomes available, services can be reprotected and failed back.
  
### Recovery Objectives

#### Recovery Point Objective (RPO)

- The solution was designed to maintain a low RPO by continuously replicating VM changes to the recovery region.

- Target RPO: Less than 15 minutes

- This ensures minimal data loss during a disaster scenario.

#### Recovery Time Objective (RTO)

- The estimated recovery time is based on Azure Site Recovery failover operations.

- Target RTO: Less than 1 hour

Actual recovery times may vary depending on:

- VM size
- Data volume
- Region availability
- Network performance
  
### Failover Testing

A validation strategy was implemented to confirm disaster recovery readiness.

#### Planned Validation Activities

- Verify replication health status.
- Confirm creation of recovery points.
- Validate backup job success.
- Review failover configuration.
- Verify recovery plans and target resources.
  
### Test Failover Limitation

A full test failover could not be completed because the Azure subscription's available vCPU quota in the target region was insufficient to provision the replicated virtual machine during testing.

Despite this limitation:

- Initial replication completed successfully.
- Recovery points were successfully generated.
- Replication health remained healthy.
- Azure Site Recovery reported the VM as protected and ready for failover.

This demonstrates that the disaster recovery configuration was successfully deployed and operational, although full failover testing could not be validated within the project's subscription constraints.

### Security Considerations

The Backup and DR design incorporates several security controls:

- Recovery Services Vault soft delete enabled.
- Backup data protected through Azure RBAC.
- Azure Key Vault used for secure credential management.
- Private networking implemented where applicable.
- Microsoft Defender for Cloud monitoring enabled.
- Backup and recovery operations audited through Azure Monitor logs.

### Design Benefits

The implemented Backup and Disaster Recovery solution provides:

- Automated VM backups.
- Centralized backup management.
- Geo-separated disaster recovery environment.
- Rapid workload recovery capabilities.
- Reduced risk of extended service outages.
- Improved business continuity and resilience.


#### Conclusion: 
- The Backup and Disaster Recovery design provides a resilient protection strategy for business-critical workloads by combining Azure Backup for data protection and Azure Site Recovery for business continuity. 
- The solution aligns with Azure best practices and significantly improves the organization's ability to recover from operational failures or regional service disruptions.
