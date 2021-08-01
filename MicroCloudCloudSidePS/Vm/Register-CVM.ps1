function Register-CVM {
    <#
        .SYNOPSIS
        Tells the server that this VM has the IP Adress xxx.xxx.xxx.xxx
    #>
    [CmdletBinding()]
    param (
    )
    
    process {
        $uri = [string]$global:MICROCLOUD_ApiUrl
        if ( -not ($uri.EndsWith("/")) ) {
            $uri = $uri + "/"
        }
        $uri = $uri + "Vm/IAm?name=" + $global:MICROCLOUD_VmName

        Invoke-WebRequest -Uri $uri -UseBasicParsing
    }
}