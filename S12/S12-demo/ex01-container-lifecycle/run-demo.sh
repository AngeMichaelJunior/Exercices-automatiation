#!/usr/bin/env sh
set -eu

echo "Nettoyage du conteneur demo-nginx s'il existe..."
echo "Nettoyage du conteneur existant si nécessaire..."
docker rm -f demo-nginx >/dev/null 2>&1 || true

echo "Téléchargement de l'image nginx:1.27-alpine..."
docker pull nginx:1.27-alpine

echo "Démarrage du conteneur demo-nginx sur le port 8080..."
docker run -d --name demo-nginx -p 8080:80 nginx:1.27-alpine

echo "Conteneurs en cours d'exécution :"
docker ps --filter "name=demo-nginx"

echo "Derniers journaux :"
docker logs --tail 10 demo-nginx

echo "Test de réponse HTTP :"
curl -s -w "\nCode: %{http_code}\n" http://localhost:8080 || echo "Attention : le serveur peut ne pas être prêt."

echo "URL : http://localhost:8080"

# ============================== NETTOYAGE ==============================
echo "Nettoyage du conteneur demo-nginx..."
docker stop demo-nginx >/dev/null 2>&1 || true
docker rm -f demo-nginx >/dev/null 2>&1 || true

echo "Nettoyage de l'image nginx:1.27-alpine..."
docker image rm -f nginx:1.27-alpine >/dev/null 2>&1 || true

echo "Démonstration terminée."