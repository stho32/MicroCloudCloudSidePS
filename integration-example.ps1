<#
    This file defines a small set of environment stuff, so the vm can communicate with 
    the infrastructure around it.

    It should be located at C:\MicroCloud\integration.ps1 .

    The $$ values are automatically replaced by the MICROCLOUD when creating a new VM.
#>
$global:MICROCLOUD_VmName = '$VMNAME$'
$global:MICROCLOUD_ApiUrl = '$APIURL$'