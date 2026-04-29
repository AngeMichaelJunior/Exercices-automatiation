#!/usr/bin/env sh
set -eu

mkdir -p config

echo "Nettoyage des services existants..."
docker compose down --remove-orphans >/dev/null 2>&1 || true

echo "Démarrage de la pile d'observabilité..."
docker compose up -d

echo "Attente de 5 secondes pour que les services démarrent..."
sleep 5

echo "Services en cours d'exécution :"
docker compose ps

echo "Accès aux interfaces :"
echo "Prometheus : http://localhost:9090"
echo "Grafana : http://localhost:3000 (admin/admin)"
echo "Node-exporter metrics : http://localhost:9100/metrics"

echo "Test de connectivité vers Prometheus..."
curl -s http://localhost:9090/api/v1/query?query=up | head -c 100

echo ""
echo "Test de connectivité vers Grafana..."
curl -s -w "\nCode: %{http_code}\n" http://localhost:3000/api/health

echo "Inspection du réseau observability :"
docker network inspect observability

echo "Journaux de Prometheus :"
docker compose logs prometheus --tail 10

echo "Journaux de Grafana :"
docker compose logs grafana --tail 10

# ============================== NETTOYAGE ==============================
echo "Arrêt et suppression des services..."
docker compose down --remove-orphans

echo "Démonstration Ex10 terminée."
