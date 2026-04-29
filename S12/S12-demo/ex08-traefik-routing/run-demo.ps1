$ErrorActionPreference = 'Stop'

Write-Host "Nettoyage des services existants..."
docker compose down --remove-orphans 2>$null | Out-Null

Write-Host "Démarrage de Traefik et des services..."
docker compose up -d

Write-Host "Attente de 5 secondes pour que Traefik démarre..."
Start-Sleep -Seconds 5

Write-Host "Services en cours d'exécution :"
docker compose ps

Write-Host "Accès au dashboard Traefik..."
Write-Host "Dashboard disponible sur : http://localhost:8090/dashboard/"

Write-Host "Inspection du réseau demo-proxy :"
docker network inspect demo-proxy

Write-Host "Attente de 3 secondes avant les tests..."
Start-Sleep -Seconds 3

Write-Host "Test d'accès à /service1 via Traefik :"
try {
    $response = Invoke-WebRequest -Uri "http://localhost:8080/service1" -TimeoutSec 3 -ErrorAction Stop
    Write-Host "Réponse : $($response.StatusCode)"
} catch {
    Write-Host "Attention : les services peuvent ne pas être prêts."
}

Write-Host "Journaux de Traefik :"
docker logs --tail 20 demo-traefik

# ============================== NETTOYAGE ==============================
Write-Host "Arrêt et suppression des services..."
docker compose down --remove-orphans

Write-Host "Démonstration Ex08 terminée."
