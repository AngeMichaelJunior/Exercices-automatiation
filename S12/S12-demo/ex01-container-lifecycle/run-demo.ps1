$ErrorActionPreference = 'Stop'

Write-Host "Nettoyage du conteneur existant si nécessaire..."
docker rm -f demo-nginx 2>$null | Out-Null

Write-Host "Téléchargement de l'image nginx:1.27-alpine..."
docker pull nginx:1.27-alpine

Write-Host "Démarrage du conteneur demo-nginx sur le port 8080..."
docker run -d --name demo-nginx -p 8080:80 nginx:1.27-alpine

Write-Host "Conteneurs en cours d'exécution :"
docker ps --filter "name=demo-nginx"

Write-Host "Derniers journaux :"
docker logs --tail 10 demo-nginx

Write-Host "Test de réponse HTTP :"
try {
    $response = Invoke-WebRequest -Uri "http://localhost:8080" -TimeoutSec 3 -ErrorAction Stop
    Write-Host "Réponse reçue : $($response.StatusCode)"
    Write-Host "Contenu de la page :"
    Write-Host $response.Content
} catch {
    Write-Host "Attention : le serveur peut ne pas être prêt."
}

Write-Host "URL : http://localhost:8080"

# ============================== NETTOYAGE ==============================
Write-Host "Nettoyage du conteneur demo-nginx..."
docker stop demo-nginx 2>$null | Out-Null
docker rm -f demo-nginx 2>$null | Out-Null

Write-Host "Nettoyage de l'image nginx:1.27-alpine..."
docker image rm -f nginx:1.27-alpine 2>$null | Out-Null

Write-Host "Démonstration terminée."
