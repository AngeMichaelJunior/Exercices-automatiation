#!/usr/bin/env sh
set -eu

echo "Suppression du réseau existant si nécessaire..."
docker network rm demo-network >/dev/null 2>&1 || true

echo "Suppression des conteneurs existants si nécessaire..."
docker rm -f demo-web demo-client >/dev/null 2>&1 || true

echo "Création du réseau personnalisé demo-network..."
docker network create demo-network

echo "Démarrage du conteneur web sur le réseau demo-network..."
docker run -d --name demo-web --network demo-network nginx:1.27-alpine

echo "Attente de 2 secondes pour que Nginx démarre..."
sleep 2

echo "Inspection du réseau demo-network :"
docker network inspect demo-network

echo "Lancement du test de ping depuis le client vers demo-web par DNS..."
docker run --rm --name demo-client --network demo-network busybox ping -c 4 demo-web

# ============================== NETTOYAGE ==============================
echo "Nettoyage du conteneur demo-web..."
docker rm -f demo-web >/dev/null 2>&1 || true

echo "Suppression du réseau demo-network..."
docker network rm demo-network >/dev/null 2>&1 || true

echo "Démonstration terminée."
