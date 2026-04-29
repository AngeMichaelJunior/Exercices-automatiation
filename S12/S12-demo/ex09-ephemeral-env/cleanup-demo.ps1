$ErrorActionPreference = 'Continue'

Write-Host "Nettoyage des services Ex09..."
docker compose down --remove-orphans 2>$null | Out-Null

Write-Host "Nettoyage Ex09 terminé."
