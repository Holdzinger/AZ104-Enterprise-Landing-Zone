# Recovery Services Vault Validation

## Objective

Verify Azure Backup is protecting the virtual machine.

## Validation Command

Get-AzRecoveryServicesBackupItem `
    -WorkloadType AzureVM `
    -VaultId $vault.ID

## Result

- Protection Status : Healthy

## Backup Job Validation

Get-AzRecoveryServicesBackupJob `
    -VaultId $vault.ID

## Result

- Status : Completed
- Operation : Backup

## Portal Validation

- Recovery Services Vault
- Backup Items
- Protected VM visible
- Recovery Points available

## Validation Successful 
