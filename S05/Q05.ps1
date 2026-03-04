#(Get-ADComputer -Filter 'Name -like "LQ3517-*"').Name

$ordinateurAD = Get-ADComputer -Filter 'Name -like "LQ3517-*"' | Select  -ExpandProperty Name

Invoke-Command -ComputerName $ordinateurAD -ScriptBlock  {
winget install --id Microsoft.PowerShell --source winget
}