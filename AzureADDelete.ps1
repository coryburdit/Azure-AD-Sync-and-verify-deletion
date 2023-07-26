<#
Delete users from M365.
Cory Burditt
Version 1.0
7/26/2023
#>

Connect-MsolService

#Get the Delted Users
Get-MsolUser -All -ReturnDeletedUsers | Sort-Object DisplayName

#Delete the Delted users
$User = Read-host -prompt "Enter email address for the user that needs to be fully removed:"
Remove-MsolUser -UserPrincipalName $user -RemoveFromRecycleBin

#verify
Get-MsolUser -All -ReturnDeletedUsers | Sort-Object DisplayName