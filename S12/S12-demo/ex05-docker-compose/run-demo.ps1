$ErrorActionPreference = 'Stop'

Write-Host "Nettoyage des services existants..."
docker compose down --remove-orphans 2>$null | Out-Null

Write-Host "Démarrage des services avec docker compose up..."
docker compose up -d

Write-Host "Attente de 3 secondes pour que les services démarrent..."
Start-Sleep -Seconds 3

Write-Host "Services en cours d'exécution :"
docker compose ps

Write-Host "Journaux du service web :"
docker compose logs web

Write-Host "Journaux du service db :"
docker compose logs db

Write-Host "Inspection du réseau demo-net :"
docker network inspect demo-net

Write-Host "Test de connectivité vers http://localhost:8095..."
try {
    $response = Invoke-WebRequest -Uri "http://localhost:8095" -TimeoutSec 3 -ErrorAction Stop
    Write-Host "Réponse HTTP : $($response.StatusCode)"
} catch {
    Write-Host "Attention : Nginx peut ne pas être complètement prêt."
}

# ============================== NETTOYAGE ==============================
Write-Host "Arrêt et suppression des services..."
docker compose down --remove-orphans

Write-Host "Démonstration Ex05 terminée."
