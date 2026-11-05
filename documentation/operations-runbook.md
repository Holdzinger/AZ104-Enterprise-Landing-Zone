# Operations Runbook

##Azure Secure Infrastructure, Backup, DR, Monitoring & Security Project

Project Name: LexCorp Production Environment
- Environment: Azure Production
- Author: Alex Holdzinger
- Version: 1.0
- Date: November 2026

# 1. Purpose

This runbook provides operational procedures for maintaining, monitoring, securing, backing up, and recovering the Azure environment deployed for the LexCorp production workload.

The document is intended for cloud administrators, operations teams, and support personnel responsible for day-to-day management of the environment.

# 2. Environment Overview

## Deployed Resources

### Resource Type	| Resource Name
- Resource Group |	RG-LexCorp-Prod
- Virtual Network	| vnet-lexcorp-prod
- Virtual Machine	| vm-lexcorp-app01
- Bastion Host	| bas-lexcorp-prod
- Key Vault	| kv-lexcorp-prod
- Recovery Services Vault	| rsv-lexcorp-prod
- Log Analytics Workspace	| law-lexcorp-prod
- Azure Monitor	| Configured
- Network Security Groups	| Configured
- Microsoft Defender for Cloud	| Enabled

# 3. Roles and Responsibilities

### Role	| Responsibility

- Cloud Administrator	| Infrastructure management and recovery
- Security Administrator	| Security monitoring and remediation
- Operations Team	| Backup monitoring and alert response
- Service Owner	| Business approval and escalation decisions

# 4. Daily Operational Tasks

## 4.1 Verify VM Health

### Portal Navigation

Azure Portal
- → Virtual Machines
- → vm-lexcorp-app01

### Checks

- VM Status = Running
- CPU utilization within acceptable threshold
- Memory not exhausted
- No active Azure Advisor critical recommendations
- No service interruptions

### Expected Result

- Provisioning State: Succeeded
- Power State: Running
- Health State: Available

## 4.2 Review Monitoring Alerts

### Portal Navigation

Azure Monitor
- → Alerts
- → Alert Rules

### Verify

- No active Critical alerts
- Action Groups functioning
- Alert history reviewed
  
### Actions if Alert Exists
- Identify source.
- Review affected resource.
- Determine business impact.
- Remediate issue.
- Document incident.

## 4.3 Review Defender for Cloud

### Portal Navigation

Microsoft Defender for Cloud
- → Recommendations

### Tasks

Review:

- Security recommendations
- Secure Score changes
- Regulatory compliance dashboards
- Resource health findings

### Expected Result

No high-severity recommendations remain unresolved.

# 5. Weekly Operational Tasks

## 5.1 Validate Backups

### Portal Navigation

Recovery Services Vault
- → Backup Jobs


### Verify:

- Successful backup completion
- No failed jobs
- No warning events


### Success Criteria

#### Item	| Expected

Daily Backup	| Successful
Recovery Points	| Available
Retention Policy	| Active
Monitoring Alerts	| Functional


## 5.2 Review Cost Management

### Portal Navigation

Cost Management + Billing
- → Cost Analysis


#### Review:

- Current spend
- Forecast spend
- Resource cost breakdown
- Unexpected increases

### Escalation Threshold

Investigate any cost increase exceeding:

- 20% above expected monthly estimate

# 6. Monthly Operational Tasks

## 6.1 Backup Restore Validation

### Purpose:

Validate recovery points remain recoverable.

### Procedure

- Open Recovery Services Vault.
- Select Protected Items.
- Select VM.
- Choose Restore VM.
- Validate restore options.

### Expected Outcome

Recovery point available and restorable.

### Evidence Required

#### Screenshot:

- Recovery point
- Restore wizard
- Restore readiness validation

## 6.2 Security Review

#### Review:

- NSG Rules
- Key Vault Access
- Defender Recommendations
- RBAC Assignments

#### Verify:

- Least privilege maintained
- No unused elevated permissions
- No public exposure introduced

# 7. Incident Management

## Critical Severity (P1)

#### Examples:

- Production VM unavailable
- Data loss event
- Security breach

### Response

- Assess impact immediately.
- Escalate to Service Owner.
- Determine restore requirement.
- Initiate DR procedure if required.
- Document timeline.

## Medium Severity (P2)

#### Examples:

- Backup failure
- Alert failures
- Monitoring issues

### Response

- Investigate root cause.
- Resolve issue.
- Validate service restoration.
- Update operational records.


# 8. Backup Operations

## Backup Configuration

### Setting	| Value

- Backup Type	| Azure VM Backup
- Vault	| rsv-lexcorp-prod
- Schedule	| Daily
- Recovery Points	| Configured
- Monitoring	| Enabled

## Backup Verification Procedure

### Portal

Recovery Services Vault
- → Backup Jobs


#### Verify:

- Job Status = Completed
- No Warnings
- No Failures

### Evidence

#### Capture screenshot showing:

- Job successful
- Completion timestamp


# 9. Disaster Recovery Procedures

## DR Recovery Trigger

Execute DR only when:

- Production VM failure
- Azure regional outage
- Corruption of production workload
- Business continuity event


## Recovery Objectives

### Metric	| Result

- Target RPO	| ≤ 24 Hours
- Actual RPO	| Based on latest successful backup
- Target RTO	| ≤ 4 Hours
- Actual RTO	| Based on tested restore process
  
## DR Recovery Procedure

## Step 1

### Identify latest successful recovery point.

Recovery Services Vault
- → Backup Items
- → Recovery Points

## Step 2

### Initiate Restore.

- Restore VM

## Step 3

### Select:

- Create New Virtual Machine

## Step 4

### Validate:

- VM boot status
- Network connectivity
- Application availability

## Step 5

- Update DNS or business routing if required.

## Step 6

### Document:

- Recovery time
- Recovery point used
- Success/failure
- Issues encountered


# 10. Key Vault Operations

## Monthly Validation

### Portal

Key Vault
- → Networking


### Verify:

- Public access settings
- Firewall configuration
- Private access requirements

### Review

- Secrets validity
- Expired secrets
- Access policies or RBAC assignments


#11. Monitoring and Logging

## Log Analytics Validation

### Portal

Log Analytics Workspace
- → Logs


### Run sample query:

KQL
- Heartbeat
- | summarize LastHeartbeat=max(TimeGenerated) by Computer

### Expected:

Recent heartbeat received from managed resources.

## Alert Validation

### Review:

Azure Monitor
- → Alert Rules


### Confirm:

- Alert rule enabled
- Action group attached
- Notification operational


# 12. Change Management

## Before any infrastructure change:

- Record change request.
- Assess impact.
- Confirm backup completed successfully.
- Implement change.
- Validate functionality.
- Document outcome.


# 13. Escalation Matrix

### Severity	| Response Time

- Critical (P1)	| Immediate
- High (P2)	| < 1 Hour
- Medium (P3)	| < 4 Hours
- Low (P4)	| Next Business Day

  
# 14. Operational Checklist

## Daily

- Verify VM health
- Review Azure Monitor alerts
- Check Defender recommendation
 
## Weekly

- Verify backup success
- Review backup jobs
- Review Azure costs

## Monthly

- Test backup restore Review security posture
- Review RBAC assignments
- Validate monitoring and alerting
- Review Key Vault configuration
  
## Quarterly

- Conduct disaster recovery exercise
- Review architecture documentation
- Review security baseline
- Review cost optimization opportunities
  
## Acceptance Criteria

The environment is considered operationally healthy when:

- All backups complete successfully
- Recovery points are available
- Monitoring alerts are functional
- Defender recommendations are reviewed
- Security controls remain compliant
- DR procedures are documented and validated
- Actual RPO and RTO objectives are maintained within project targets

