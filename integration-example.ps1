<#
    This file defines a small set of environment stuff, so the vm can communicate with 
    the infrastructure around it.

    It should be located at C:\MicroCloud\integration.ps1 .

    The $$ values are automatically replaced by the MICROCLOUD when creating a new VM.
#>
$global:MICROCLOUD_VmName = '$VMNAME$'
$global:MICROCLOUD_ApiUrl = '$APIURL$'

Import-Module C:\MicroCloud\MicroCloudCloudSidePS\Module\MicroCloudCloudSidePS.psm1

# We run this after the computer has his real new vm name applied
if ( $env:COMPUTERNAME -eq $global:MICROCLOUD_VmName) {

    # Add Port Forwarding for Remote Desktop to the entrance router
    #Add-CVMPortForwarding -MyPort 3389

    # Tell the cloud I am here!
    Register-CVM
}
