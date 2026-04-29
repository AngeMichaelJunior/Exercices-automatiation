$ErrorActionPreference = 'Continue'

Write-Host "Suppression des conteneurs Ex04..."
docker rm -f demo-web demo-client 2>$null | Out-Null

Write-Host "Suppression du réseau demo-network..."
docker network rm demo-network 2>$null | Out-Null

Write-Host "Nettoyage Ex04 terminé."
