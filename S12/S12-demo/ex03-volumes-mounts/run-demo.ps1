$ErrorActionPreference = 'Stop'

Write-Host "Suppression des ressources Ex03 existantes si nécessaire..."
docker rm -f demo-persistent 2>$null | Out-Null
docker volume rm demo-storage 2>$null | Out-Null

Write-Host "Création du dossier output pour le bind mount..."
if (-not (Test-Path "output")) {
    New-Item -ItemType Directory -Path "output" | Out-Null
}

Write-Host "Création du volume nommé demo-storage..."
docker volume create demo-storage

Write-Host "Construction de l'image demo-persistent:1.0..."
docker build -t demo-persistent:1.0 .

Write-Host "Démarrage du conteneur avec volume nommé et bind mount..."
docker run -d --name demo-persistent -v demo-storage:/app/storage -v "$PWD/output:/app/output" -v "$PWD/config/message.txt:/app/config/message.txt:ro" demo-persistent:1.0

Write-Host "Conteneurs en cours d'exécution :"
docker ps --filter "name=demo-persistent"

Write-Host "Attente de 3 secondes pour l'exécution du script..."
Start-Sleep -Seconds 3

Write-Host "Journaux du conteneur :"
docker logs demo-persistent

Write-Host "Contenu du volume nommé :"
docker exec demo-persistent ls -la /app/storage/

Write-Host "Contenu du bind mount :"
docker exec demo-persistent ls -la /app/output/

Write-Host "Lecture d'une donnée du volume nommé :"
docker exec demo-persistent cat /app/storage/persistent-data.txt

Write-Host "Suppression du conteneur..."
docker rm -f demo-persistent 2>$null | Out-Null

Write-Host "Vérification que le volume existe toujours..."
docker volume ls

Write-Host "Redémarrage avec le même volume pour vérifier la persistance..."
docker run -d --name demo-persistent-verification -v demo-storage:/app/storage alpine sh -c "cat /app/storage/persistent-data.txt && sleep 60"

Write-Host "Conteneur de vérification créé, consulter les données :"
docker exec demo-persistent-verification cat /app/storage/persistent-data.txt

# ============================== NETTOYAGE ==============================
Write-Host "Nettoyage du conteneur de vérification..."
docker rm -f demo-persistent-verification 2>$null | Out-Null

Write-Host "Nettoyage du conteneur principal..."
docker rm -f demo-persistent 2>$null | Out-Null

Write-Host "Nettoyage de l'image..."
docker image rm -f demo-persistent:1.0 2>$null | Out-Null

Write-Host "Nettoyage du volume nommé..."
docker volume rm demo-storage 2>$null | Out-Null

Write-Host "Démonstration terminée."
