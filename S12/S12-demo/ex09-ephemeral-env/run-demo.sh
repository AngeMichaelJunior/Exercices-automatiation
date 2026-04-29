#!/usr/bin/env sh
set -eu

mkdir -p scripts

echo "Nettoyage des services existants..."
docker compose down --remove-orphans >/dev/null 2>&1 || true

echo "Lancement de la pile de test éphémère..."
docker compose up --abort-on-container-exit

exit_code=$?
echo "Code de sortie des tests : $exit_code"

echo "État des conteneurs :"
docker compose ps -a

echo "Journaux du test-runner :"
docker compose logs demo-test-runner

# ============================== NETTOYAGE ==============================
echo "Arrêt et suppression des services..."
docker compose down --remove-orphans

echo "Démonstration Ex09 terminée avec exit code : $exit_code"

exit $exit_code
