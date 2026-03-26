cls
$source = 'U:\MES ETUDES\2e année\4e session\Automatisation des tâches\Exercices\Exercices-automatiation\S02'
$dateLimite= (get-date).AddDays(-30) 
$DossierCourant = Get-Location
$Archive = New-Item -Name "Archive" -ItemType Directory -Path $DossierCourant



Get-ChildItem -Path $source | Where-Object {$_.Extension -eq '.log' -and $_.CreationTime -lt $dateLimite} | Move-Item -Destination $Archive 