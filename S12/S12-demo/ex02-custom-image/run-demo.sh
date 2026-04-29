#!/usr/bin/env sh
set -eu

echo "Suppression du conteneur existant si nécessaire..."
docker rm -f demo-custom-web >/dev/null 2>&1 || true

# doit être dans le même dossier que le Dockerfile
cd "$(dirname "$0")"

echo "Construction de l'image demo-custom-web:1.0..."
docker build -t demo-custom-web:1.0 .

echo "Historique des couches de l'image :"
docker image history demo-custom-web:1.0

echo "Démarrage du conteneur demo-custom-web sur le port 8090..."
docker run -d --name demo-custom-web -p 8090:80 demo-custom-web:1.0

echo "Conteneurs en cours d'exécution :"
docker ps --filter "name=demo-custom-web"

echo "Derniers journaux :"
docker logs --tail 10 demo-custom-web

echo "URL : http://localhost:8090"
#modifier html avec une commande executée dans le conteneur
echo "Modification du contenu de la page d'accueil..."
docker exec demo-custom-web sh -c "sed -i 's/CustomDocker Image/site web personnalisé !/' /usr/share/nginx/html/index.html"


# ============================== NETTOYAGE ==============================
echo "Nettoyage du conteneur demo-custom-web..."
docker rm -f demo-custom-web >/dev/null 2>&1 || true

echo "Nettoyage de l'image demo-custom-web:1.0..."
docker image rm -f demo-custom-web:1.0 >/dev/null 2>&1 || true

echo "Démonstration terminée."