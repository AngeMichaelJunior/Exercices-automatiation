$ErrorActionPreference = 'Stop'

Write-Host "Création du répertoire config si nécessaire..."
if (-not (Test-Path "config")) {
    New-Item -ItemType Directory -Path "config" -Force | Out-Null
}

Write-Host "Nettoyage des services existants..."
docker compose down --remove-orphans 2>$null | Out-Null

Write-Host "Démarrage de la pile d'observabilité..."
docker compose up -d

Write-Host "Attente de 5 secondes pour que les services démarrent..."
Start-Sleep -Seconds 5

Write-Host "Services en cours d'exécution :"
docker compose ps

Write-Host "Accès aux interfaces :"
Write-Host "Prometheus : http://localhost:9090"
Write-Host "Grafana : http://localhost:3000 (admin/admin)"
Write-Host "Node-exporter metrics : http://localhost:9100/metrics"

Write-Host "Test de connectivité vers Prometheus..."
try {
    $response = Invoke-WebRequest -Uri "http://localhost:9090/api/v1/query?query=up" -TimeoutSec 3 -ErrorAction Stop
    Write-Host "Prometheus répond : $($response.StatusCode)"
} catch {
    Write-Host "Attention : Prometheus peut ne pas être prêt."
}

Write-Host "Test de connectivité vers Grafana..."
try {
    $response = Invoke-WebRequest -Uri "http://localhost:3000/api/health" -TimeoutSec 3 -ErrorAction Stop
    Write-Host "Grafana répond : $($response.StatusCode)"
} catch {
    Write-Host "Attention : Grafana peut ne pas être prêt."
}

Write-Host "Inspection du réseau observability :"
docker network inspect observability

Write-Host "Journaux de Prometheus :"
docker compose logs prometheus --tail 10

Write-Host "Journaux de Grafana :"
docker compose logs grafana --tail 10

# ============================== NETTOYAGE ==============================
Write-Host "Arrêt et suppression des services..."
docker compose down --remove-orphans

Write-Host "Démonstration Ex10 terminée."
