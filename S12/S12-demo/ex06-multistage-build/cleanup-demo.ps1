$ErrorActionPreference = 'Continue'

Write-Host "Nettoyage des ressources Ex06..."
docker rm -f demo-multistage 2>$null | Out-Null
docker image rm -f demo-multistage:1.0 2>$null | Out-Null

Write-Host "Nettoyage Ex06 terminé."
