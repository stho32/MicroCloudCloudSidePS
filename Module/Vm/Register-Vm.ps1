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
        $uri = $uri + "Vm/IAm?name=" + $env:ComputerName

        Invoke-WebRequest -Uri $global:MICROCLOUD_ApiUrl
    }
}