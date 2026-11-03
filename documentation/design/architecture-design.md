# Architecture Design

## Overview

The solution was designed as a secure and highly available Azure infrastructure hosted in the South Africa North region, with disaster recovery capabilities in East US through Azure Site Recovery. The environment provides secure remote administration, data protection, monitoring, and business continuity while following Microsoft Azure security best practices.

## Design Objectives

- Provide a secure cloud-hosted application environment.
- Enable controlled administrative access.
- Protect workloads through backup and disaster recovery.
- Centralize monitoring, logging, and alerting.
- Secure sensitive data and credentials.
- Minimize operational risk through least-privilege access controls.

## Core Components

### Azure Virtual Machine

The virtual machine hosts the application workload and serves as the primary compute resource within the environment.

#### Responsibilities:

- Hosts production services.
- Serves as the protected workload.
- Sends diagnostic logs and metrics to Azure Monitor.
- Protected by Azure Backup and Site Recovery.
  
### Virtual Network (VNet)

The Virtual Network provides network isolation and secure communication between Azure resources.

### Address Space

- 10.0.0.0/16

### Subnets

#### Subnet |	Purpose
- AzureBastionSubnet	| Bastion host connectivity
- Workload Subnet |	Virtual machine hosting

#### Benefits

- Segmentation of workloads.
- Reduced attack surface.
- Future scalability.

### Network Security Groups (NSGs)

Network Security Groups control inbound and outbound traffic to the virtual machine subnet.

#### Security Controls

- RDP/SSH access blocked from the public internet.
- Access only through Azure Bastion.
- Restrictive inbound rule set.
- Outbound communication controlled where required.

### Azure Bastion

Azure Bastion provides secure browser-based administration without exposing management ports publicly.

#### Benefits

- No public IP required for VM access.
- Eliminates direct RDP exposure.
- Reduces attack surface.
- Secure management traffic remains within Azure.

### Azure Key Vault

Azure Key Vault stores sensitive information securely.

#### Configuration

- RBAC enabled.
- Soft Delete enabled.
- Purge Protection enabled.
- Public Access disabled.

#### Stored Items

- Secrets
- Credentials
- Connection strings
- Encryption-related information

#### Benefits

- Centralized secret management.
- Improved security posture.
- Supports compliance best practices.
  
### Recovery Services Vault

The Recovery Services Vault provides both backup and disaster recovery functionality.

### Azure Backup

#### Configured to:

- Protect the virtual machine.
- Maintain recovery points.
- Enable restoration following accidental deletion or corruption.
  
### Azure Site Recovery

#### Configured to:

- Replicate workloads from South Africa North to East US.
- Support failover during a regional outage.
- Provide business continuity capabilities.
  
### Log Analytics Workspace

The Log Analytics Workspace serves as the central repository for logs and telemetry.

#### Collected Data

- Azure Activity Logs
- Virtual Machine Insights
- Security events
- Resource diagnostics

#### Benefits

- Centralized monitoring.
- Improved troubleshooting.
- Historical analysis of events.
  
### Azure Monitor

Azure Monitor provides real-time visibility into infrastructure health.

#### Monitoring Features

- Performance monitoring.
- Availability monitoring.
- Alerting.
- Resource health monitoring.

#### Configured Alerts

- High CPU Usage
- High Memory Usage
- VM Availability
- Backup Status Monitoring

### Security Architecture

The solution follows a defense-in-depth security model.

#### Identity Security
- Azure RBAC implemented.
- Least privilege access model.
- Administrative access restricted to authorized users.

#### Network Security
- Private VNet architecture.
- NSG protection.
- Azure Bastion connectivity.
- No public exposure of management ports.

#### Data Security
- Key Vault for secrets management.
- Backup encryption.
- Recovery Services Vault protection.

### Business Continuity and Disaster Recovery

#### Backup Strategy
- Component |	Protection Method
- Virtual Machine |	Azure Backup
- VM Data |	Recovery Points
- Configuration |	ARM/Bicep Templates

#### Disaster Recovery Strategy

#### Function |	Solution
- Replication |	Azure Site Recovery
- Secondary Region |	East US
- Recovery Objective |	Regional failover capability
- Testing |	Initial failover completed successfully

Note: A full Test Failover could not be completed due to subscription core limitations; however, replication health and initial failover configuration were successfully validated.

#### Architectural Benefits
- Secure administration through Azure Bastion.
- Centralized monitoring and alerting.
- Resilient backup and recovery solution.
- Disaster recovery across regions.
- Secure secrets management with Key Vault.
- Scalable network architecture.
- Alignment with Microsoft Azure Well-Architected Framework principles.

