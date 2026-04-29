$ErrorActionPreference = 'Continue'

Write-Host "Nettoyage des services Ex08..."
docker compose down --remove-orphans 2>$null | Out-Null

Write-Host "Nettoyage Ex08 terminé."
