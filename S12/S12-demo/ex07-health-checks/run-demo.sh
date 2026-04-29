#!/usr/bin/env sh
set -eu

echo "Suppression du conteneur existant si nécessaire..."
docker rm -f demo-health >/dev/null 2>&1 || true

echo "Suppression de l'image existante si nécessaire..."
docker image rm -f demo-health:1.0 >/dev/null 2>&1 || true

echo "Construction de l'image demo-health:1.0..."
docker build -t demo-health:1.0 .

echo "Démarrage du conteneur avec health check et restart policy..."
docker run -d --name demo-health --restart=on-failure:3 -p 8097:80 demo-health:1.0

echo "Attente de 5 secondes pour que le health check démarre..."
sleep 5

echo "État du health check :"
docker inspect --format='{{json .State.Health}}' demo-health

echo "Informations du conteneur :"
docker inspect demo-health | head -n 50

echo "Journaux du conteneur :"
docker logs --tail 10 demo-health

echo "Test de réponse HTTP :"
curl -s -w "\nCode: %{http_code}\n" http://localhost:8097

# ============================== NETTOYAGE ==============================
echo "Nettoyage du conteneur demo-health..."
docker rm -f demo-health >/dev/null 2>&1 || true

echo "Nettoyage de l'image demo-health:1.0..."
docker image rm -f demo-health:1.0 >/dev/null 2>&1 || true

echo "Démonstration Ex07 terminée."
