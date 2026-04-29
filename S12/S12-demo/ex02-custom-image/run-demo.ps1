$ErrorActionPreference = 'Stop'

Write-Host "Suppression du conteneur existant si nécessaire..."
docker rm -f demo-custom-web 2>$null | Out-Null

# doit être dans le même dossier que le Dockerfile
cd $PSScriptRoot
Write-Host "Construction de l'image demo-custom-web:1.0..."
docker build -t demo-custom-web:1.0 .

Write-Host "Historique des couches de l'image :"
docker image history demo-custom-web:1.0

Write-Host "Démarrage du conteneur demo-custom-web sur le port 8090..."
docker run -d --name demo-custom-web -p 8090:80 demo-custom-web:1.0

Write-Host "Conteneurs en cours d'exécution :"
docker ps --filter "name=demo-custom-web"

Write-Host "Derniers journaux :"
docker logs --tail 10 demo-custom-web

Write-Host "URL : http://localhost:8090"

#modifier html avec une commande executée dans le conteneur
Write-Host "Modification du contenu de la page d'accueil..."
docker exec demo-custom-web sh -c "sed -i 's/CustomDocker Image/site web personnalisé !/' /usr/share/nginx/html/index.html"

# ============================== NETTOYAGE ==============================
Write-Host "Nettoyage du conteneur demo-custom-web..."
docker rm -f demo-custom-web 2>$null | Out-Null

Write-Host "Nettoyage de l'image demo-custom-web:1.0..."
docker image rm -f demo-custom-web:1.0 2>$null | Out-Null

Write-Host "Démonstration terminée."