<################################################################################
# Force sync to Azure AD and verify deletion                                   #
# Author: Cory Burditt                                                         #
# Date: March 16  , 2018                                                       #
# Description: This script deleation of user mail box form hybrid Exchange     #
################################################################################>
Connect-ExchangeOnline
$mailbox = Read-Host -Prompt "Enter Address to verify that is deleted."
Get-Mailbox -SoftDeletedMailbox -identity $mailbox