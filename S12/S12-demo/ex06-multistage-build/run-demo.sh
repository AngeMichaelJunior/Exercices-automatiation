#!/usr/bin/env sh
set -eu

echo "Suppression du conteneur existant si nécessaire..."
docker rm -f demo-multistage >/dev/null 2>&1 || true

echo "Suppression de l'image existante si nécessaire..."
docker image rm -f demo-multistage:1.0 >/dev/null 2>&1 || true

echo "Construction de l'image multi-étapes demo-multistage:1.0..."
docker build -t demo-multistage:1.0 .

echo "Historique des couches :"
docker image history demo-multistage:1.0

echo "Inspection des métadonnées :"
docker image inspect demo-multistage:1.0 | head -n 20

echo "Démarrage du conteneur demo-multistage sur le port 8096..."
docker run -d --name demo-multistage -p 8096:80 demo-multistage:1.0

echo "Attente de 2 secondes pour que Nginx démarre..."
sleep 2

echo "Conteneurs en cours d'exécution :"
docker ps --filter "name=demo-multistage"

echo "Test de réponse HTTP :"
curl -s http://localhost:8096

# ============================== NETTOYAGE ==============================
echo "Nettoyage du conteneur demo-multistage..."
docker rm -f demo-multistage >/dev/null 2>&1 || true

echo "Nettoyage de l'image demo-multistage:1.0..."
docker image rm -f demo-multistage:1.0 >/dev/null 2>&1 || true

echo "Démonstration Ex06 terminée."
