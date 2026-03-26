cls
Get-NetAdapter| where-object {$_.status -eq 'up' -and $_.name -like "*Ethernet*" } | Select-Object name,status

