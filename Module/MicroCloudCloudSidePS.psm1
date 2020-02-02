<#
    MICRO CLOUD - Cloud-side API
    
    With this API the virtual machines communicate with the cloud api to integrate and communicate with the infrastructure around them
#>
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

#$global:MICROCLOUD_VmName = "MicroVM-"

# In case we are in a production scenario, we want the latest version of the 
# integration module. 
if ( $PSScriptRoot -eq "C:\MicroCloud\MicroCloudCloudSidePS" ) {
    try {
        git pull
    } catch {
    }
}

if ( -not $global:MICROCLOUD_VmName.StartsWith($env:ComputerName) ) {
    Rename-Computer -NewName $global:MICROCLOUD_VmName -Force -Restart
    exit
}

Push-Location $PSScriptRoot

Get-ChildItem -Filter "*.ps1" -Recurse | 
	ForEach-Object {
		. ($_.Fullname)
}

Pop-Location
