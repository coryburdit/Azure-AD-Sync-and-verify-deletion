################################################################################
# Force sync to Azure AD and verify deletion                                   #
# Author: Cory Burditt                                                         #
# Date: March 16  , 2018                                                       #
# Description: This script Forces a sync with Azure AD of any changes made     #
#                 and verifies deleation of user mail box form hybrid Exchange #
################################################################################
Import-Module AdSync
Start-ADSyncSyncCycle -PolicyType Delta
Set-ExecutionPolicy RemoteSigned
$UserCredential = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session
Write-host "Enter Address to verify that is deleted."
$mailbox = Read-Host
Get-Mailbox -SoftDeletedMailbox -identity $mailbox