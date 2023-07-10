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
Connect-ExchangeOnline
$mailbox = Read-Host -Prompt "Enter Address to verify that is deleted."
Get-Mailbox -SoftDeletedMailbox -identity $mailbox