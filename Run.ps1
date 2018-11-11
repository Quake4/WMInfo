<#
Copyright (C) 2018  Oleg Samsonov aka Quake4
https://github.com/Quake4
License GPL-3.0
#>

param(
    [Parameter(Mandatory = $true)][string] $WMIClass
)

. .\Get-ManagementObject

[console]::Title = "WMI Info: $WMIClass"

Get-ManagementObject "select * from $WMIClass" {
	Param([Management.ManagementObjectCollection] $items)
	foreach ($each in $items) {
		Write-Host $each
		foreach ($item in $each.Properties) {
			Write-Host "$($item.Name): $($item.Value)"
		}
	}
}