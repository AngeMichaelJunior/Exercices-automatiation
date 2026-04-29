$ErrorActionPreference = 'Continue'

Write-Host "Nettoyage des services Ex05..."
docker compose down --remove-orphans 2>$null | Out-Null

Write-Host "Nettoyage Ex05 terminé."
