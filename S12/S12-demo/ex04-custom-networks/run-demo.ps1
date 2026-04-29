$ErrorActionPreference = 'Stop'

Write-Host "Suppression du réseau existant si nécessaire..."
docker network rm demo-network 2>$null | Out-Null

Write-Host "Suppression des conteneurs existants si nécessaire..."
docker rm -f demo-web demo-client 2>$null | Out-Null

Write-Host "Création du réseau personnalisé demo-network..."
docker network create demo-network

Write-Host "Démarrage du conteneur web sur le réseau demo-network..."
docker run -d --name demo-web --network demo-network nginx:1.27-alpine

Write-Host "Attente de 2 secondes pour que Nginx démarre..."
Start-Sleep -Seconds 2

Write-Host "Inspection du réseau demo-network :"
docker network inspect demo-network

Write-Host "Lancement du test de ping depuis le client vers demo-web par DNS..."
docker run --rm --name demo-client --network demo-network busybox ping -c 4 demo-web

# ============================== NETTOYAGE ==============================
Write-Host "Nettoyage du conteneur demo-web..."
docker rm -f demo-web 2>$null | Out-Null

Write-Host "Suppression du réseau demo-network..."
docker network rm demo-network 2>$null | Out-Null

Write-Host "Démonstration terminée."
