$policy = Get-AzPolicyDefinition `
    | Where-Object {$_.Properties.DisplayName -eq "Require a tag on resources"}

New-AzPolicyAssignment `
    -Name "RequireTags" `
    -PolicyDefinition $policy `
    -Scope "/subscriptions/<subscription-id>/resourceGroups/RG-LexCorp-Prod"
