cls
$csv = "$env:USERPROFILE\Desktop\Rapport_Memoire.csv"
Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 10 | Export-Csv -Path $csv
Write-Host "Le rapport csv a été crée dans $csv" -ForegroundColor green