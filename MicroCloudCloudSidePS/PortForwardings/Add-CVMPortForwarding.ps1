function Add-CVMPortForwarding {
    <#
        .SYNOPSIS
        Add a port forwarding
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [int]$myPort
    )

    process {
        $uri = [string]$global:MICROCLOUD_ApiUrl
        if ( -not ($uri.EndsWith("/")) ) {
            $uri = $uri + "/"
        }
        $uri = $uri + "PortForwarding/Add?name=" + $global:MICROCLOUD_VmName + "&myPort=" + $myPort

        Invoke-WebRequest -Uri $uri -UseBasicParsing
    }
}