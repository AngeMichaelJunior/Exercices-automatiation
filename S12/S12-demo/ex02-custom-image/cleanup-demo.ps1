$ErrorActionPreference = 'Stop'

Write-Host "Suppression du conteneur demo-custom-web si nécessaire..."
docker rm -f demo-custom-web 2>$null | Out-Null

Write-Host "Suppression de l'image demo-custom-web:1.0 si nécessaire..."
docker image rm -f demo-custom-web:1.0 2>$null | Out-Null

Write-Host "Nettoyage terminé."