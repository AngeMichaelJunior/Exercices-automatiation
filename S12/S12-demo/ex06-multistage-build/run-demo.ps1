$ErrorActionPreference = 'Stop'

Write-Host "Suppression du conteneur existant si nécessaire..."
docker rm -f demo-multistage 2>$null | Out-Null

Write-Host "Suppression de l'image existante si nécessaire..."
docker image rm -f demo-multistage:1.0 2>$null | Out-Null

Write-Host "Construction de l'image multi-étapes demo-multistage:1.0..."
docker build -t demo-multistage:1.0 .

Write-Host "Historique des couches :"
docker image history demo-multistage:1.0

Write-Host "Inspection des métadonnées :"
docker image inspect demo-multistage:1.0 | ConvertFrom-Json | Select-Object -Property Id, RepoTags, Size

Write-Host "Démarrage du conteneur demo-multistage sur le port 8096..."
docker run -d --name demo-multistage -p 8096:80 demo-multistage:1.0

Write-Host "Attente de 2 secondes pour que Nginx démarre..."
Start-Sleep -Seconds 2

Write-Host "Conteneurs en cours d'exécution :"
docker ps --filter "name=demo-multistage"

Write-Host "Test de réponse HTTP :"
try {
    $response = Invoke-WebRequest -Uri "http://localhost:8096" -TimeoutSec 3 -ErrorAction Stop
    Write-Host "Réponse reçue : $($response.StatusCode)"
} catch {
    Write-Host "Attention : le serveur peut ne pas être prêt."
}

# ============================== NETTOYAGE ==============================
Write-Host "Nettoyage du conteneur demo-multistage..."
docker rm -f demo-multistage 2>$null | Out-Null

Write-Host "Nettoyage de l'image demo-multistage:1.0..."
docker image rm -f demo-multistage:1.0 2>$null | Out-Null

Write-Host "Démonstration Ex06 terminée."
