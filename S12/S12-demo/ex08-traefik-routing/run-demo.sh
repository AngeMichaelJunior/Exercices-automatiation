#!/usr/bin/env sh
set -eu

echo "Nettoyage des services existants..."
docker compose down --remove-orphans >/dev/null 2>&1 || true

echo "Démarrage de Traefik et des services..."
docker compose up -d

echo "Attente de 5 secondes pour que Traefik démarre..."
sleep 5

echo "Services en cours d'exécution :"
docker compose ps

echo "Accès au dashboard Traefik..."
echo "Dashboard disponible sur : http://localhost:8090/dashboard/"

echo "Inspection du réseau demo-proxy :"
docker network inspect demo-proxy

echo "Attente de 3 secondes avant les tests..."
sleep 3

echo "Test d'accès à /service1 via Traefik :"
curl -s -w "\nCode: %{http_code}\n" http://localhost:8080/service1 || echo "Attention : les services peuvent ne pas être prêts."

echo "Journaux de Traefik :"
docker logs --tail 20 demo-traefik

# ============================== NETTOYAGE ==============================
echo "Arrêt et suppression des services..."
docker compose down --remove-orphans

echo "Démonstration Ex08 terminée."
