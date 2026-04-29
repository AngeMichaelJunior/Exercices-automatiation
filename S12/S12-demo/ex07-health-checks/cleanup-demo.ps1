$ErrorActionPreference = 'Continue'

Write-Host "Nettoyage des ressources Ex07..."
docker rm -f demo-health 2>$null | Out-Null
docker image rm -f demo-health:1.0 2>$null | Out-Null

Write-Host "Nettoyage Ex07 terminé."
