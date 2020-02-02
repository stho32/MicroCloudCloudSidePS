<#
    This script does everything to the vm so it can be used as an image for a lot of vms.
#>
Set-Location $PSScriptRoot

# Activate Remote Desktop
Set-ItemProperty -Path 'HKLM:SystemCurrentControlSetControlTerminal Server'-name "fDenyTSConnections" -Value 0

# Tell local firewall to accept access
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

# Copy Integration Example over to integration.ps1, where 
Copy-Item .\integration-example.ps1 .\..\integration.ps1

$RegPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
[string]$DefaultUsername = Read-Host -Prompt "Username for autologon"
[string]$DefaultPassword = Read-Host -Prompt "Password"
Set-ItemProperty $RegPath "AutoAdminLogon" -Value "1" -type String 
Set-ItemProperty $RegPath "DefaultUsername" -Value $DefaultUsername -type String 
Set-ItemProperty $RegPath "DefaultPassword" -Value $DefaultPassword -type String

# Create a scheduled task that is run every 5 minutes that executes the integration
$Action = New-ScheduledTaskAction -Execute 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe' -Argument '-ExecutionPolicy ByPass -NoProfile -File "C:\MicroCloud\integration.ps1"'
$Trigger = New-ScheduledTaskTrigger -AtLogOn
$Settings = New-ScheduledTaskSettingsSet
$Task = New-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings
Register-ScheduledTask -TaskName 'MicroCloud Integration' -InputObject $Task -User $DefaultUsername -Password $DefaultPassword
