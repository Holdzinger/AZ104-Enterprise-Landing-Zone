# Key Vault Validation

## Objective

Verify the Key Vault security configuration.

## Validation Command

Get-AzKeyVault `
    -VaultName "kv-lexcorp-prod"

## Result

- EnableRbacAuthorization : True
- EnablePurgeProtection   : True
- EnableSoftDelete        : True
- PublicNetworkAccess     : Disabled

## Additional Validation

View network configuration:

(Get-AzKeyVault `
    -VaultName "kv-lexcorp-prod").NetworkAcls

## Portal Validation

Verify:

- RBAC enabled
- Soft Delete enabled
- Purge Protection enabled
- Public access disabled

## Validation Successful
