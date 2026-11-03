# Azure Bastion Validation

## Objective

Confirm secure administrative access without exposing SSH to the Internet.

## Validation Command

Get-AzBastion `
    -ResourceGroupName "RG-LexCorp-Prod" `
    -Name "bas-lexcorp-prod"
    
## Result

- ProvisioningState : Succeeded

## Functional Test

- Open the VM.
- Select Connect.
- Select Bastion.
- Log in successfully to the Ubuntu VM.

## Evidence

- As per the image in screenshots

## Validation Successful
