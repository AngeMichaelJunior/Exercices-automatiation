#!/usr/bin/env sh
set -eu

echo "Nettoyage des services existants..."
docker compose down --remove-orphans >/dev/null 2>&1 || true

echo "Démarrage des services avec docker compose up..."
docker compose up -d

echo "Attente de 3 secondes pour que les services démarrent..."
sleep 3

echo "Services en cours d'exécution :"
docker compose ps

echo "Journaux du service web :"
docker compose logs web

echo "Journaux du service db :"
docker compose logs db

echo "Inspection du réseau demo-net :"
docker network inspect demo-net

echo "Test de connectivité vers http://localhost:8095..."
curl -s http://localhost:8095 | head -c 100

# ============================== NETTOYAGE ==============================
echo "Arrêt et suppression des services..."
docker compose down --remove-orphans

echo "Démonstration Ex05 terminée."
