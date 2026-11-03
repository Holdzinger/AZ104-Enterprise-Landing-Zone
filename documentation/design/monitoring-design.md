# Monitoring Design

## Monitoring Objectives

The monitoring solution was implemented to provide visibility into the health, performance, security, and backup status of the LexCorp production environment. The objectives were to:

- Monitor Azure infrastructure health and availability.
- Track virtual machine performance metrics.
- Generate alerts for critical operational events.
- Monitor backup success and failure events.
- Centralize log collection and analysis.
- Support disaster recovery validation and operational reporting.

## Monitoring Architecture

The monitoring solution consists of the following Azure services:

### Component |	Purpose
- Azure Monitor |	Central monitoring platform
- Log Analytics Workspace |	Stores collected logs and telemetry
- Azure Monitor Alerts |	Generates notifications when thresholds are exceeded
- Action Groups |	Sends email notifications
- Recovery Services Vault |	Provides backup monitoring
- Microsoft Defender for Cloud |	Security posture assessment and recommendations

## Log Analytics Workspace

A dedicated Log Analytics Workspace was deployed to centralize monitoring data.

#### Workspace Name:

law-lexcorp-prod

#### Data collected includes:

- VM heartbeat information
- Performance counters
- Azure Activity Logs
- Security recommendations
- Azure Backup events
- Resource health events

Retention policies were configured to allow historical investigation and troubleshooting.

## Azure Monitor Configuration

### Azure Monitor was configured to collect metrics from:

- Virtual Machines
- CPU Utilization
- Available Memory
- Network Throughput
- VM Availability
- Heartbeat Status
  
### Infrastructure Resources

- Virtual Network activity
- Bastion Host connectivity
- Recovery Services Vault operations
- Key Vault activity logs

This enables proactive detection of operational issues before they impact business services.

## Alerting Strategy

Alert Rules were created to notify administrators when predefined thresholds are exceeded.

### Implemented Alerts

#### Alert |	Threshold |	Severity
- High CPU Usage |	Greater than 80% for 5 minutes |	Sev 2
- VM Heartbeat | Lost	No heartbeat detected |	Sev 1
- Resource Health Event |	Platform issue detected |	Sev 1
- Backup Failure |	Backup job failed |	Sev 1
- Backup Warning |	Backup completed with warnings |	Sev 2
  
### Action Group

#### An Azure Monitor Action Group was configured to:

- Send email notifications.
- Trigger immediate incident awareness.
- Provide operational visibility for production workloads.

## Backup Monitoring

The Recovery Services Vault monitoring capability was used to validate backup operations.

#### The following items were monitored:

- Backup job success
- Backup failures
- Warning events
- Recovery point creation
- Restore operations

### Validation Results
#### Validation Test |	Result
- Backup Completed Successfully |	Pass
- Recovery Points Created |	Pass
- Backup Notifications Generated |	Pass
- Monitoring Integration Verified |	Pass

## Security Monitoring

Microsoft Defender for Cloud was enabled to provide security monitoring and recommendations.

#### The platform was used to:

- Identify security misconfigurations.
- Review security recommendations.
- Monitor resource security posture.
- Highlight compliance improvements.

### Example Findings
- Hardening recommendations reviewed.
- VM security posture assessed.
- Resource configuration reviewed for best practices.

## Disaster Recovery Monitoring

Monitoring was integrated with disaster recovery procedures to ensure visibility during failover and recovery activities.

#### The solution supports:

- Backup job monitoring.
- Replication health monitoring.
- Recovery Services Vault status monitoring.
- Recovery point validation.

This assists administrators in maintaining recovery readiness and meeting business continuity objectives.

## Monitoring Design Validation

Requirement |	Status
- Centralized Logging |	Completed
- Infrastructure Monitoring |	Completed
- Alerting Configuration |	Completed
- Backup Monitoring |	Completed
- Security Monitoring |	Completed
- Email Notifications |	Completed
- Disaster Recovery Monitoring |	Completed

## Conclusion

- The monitoring solution provides centralized visibility across the Azure environment through Azure Monitor, Log Analytics Workspace, Recovery Services Vault, and Microsoft Defender for Cloud. 
- Automated alerting and notification mechanisms ensure that operational, backup, and security incidents are detected and escalated promptly, supporting the project's availability, security, and disaster recovery objectives.
