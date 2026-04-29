$ErrorActionPreference = 'Continue'

Write-Host "Nettoyage des services Ex10..."
docker compose down --remove-orphans 2>$null | Out-Null

Write-Host "Nettoyage Ex10 terminé."
