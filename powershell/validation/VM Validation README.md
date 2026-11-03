# Virtual Machine Validation
## Objective

Confirm the Ubuntu VM was deployed successfully and is operational.

## Validation Command

Get-AzVM `
    -ResourceGroupName "RG-LexCorp-Prod" `
    -Name "vm-lexcorp-app01" `
    -Status

## Result

- PowerState/running
- ProvisioningState/succeeded

## Portal Validation

Navigate to Virtual Machines
- Select vm-lexcorp-app01
Confirm:
- Status = Running
- VM Agent = Ready
- Monitoring = Enabled

## Validation Successful
