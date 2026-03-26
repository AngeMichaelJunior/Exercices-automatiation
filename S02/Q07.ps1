



$source = "U:\MES ETUDES\2e année\4e session\Automatisation des tâches\Exercice"
$dateLimite = (Get-Date).AddDays(-30)
$archive = Join-Path (Get-location) "Archive"

if (!(Test-Path $archive)) {
    New-Item -ItemType Directory -Path $archive
}

Get-ChildItem $source -Filter *.log |
Where-Object {$_.CreationTime -lt $dateLimite} |
Move-Item -Destination $archive