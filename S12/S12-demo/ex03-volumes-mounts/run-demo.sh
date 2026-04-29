#!/usr/bin/env sh
set -eu

docker rm -f demo-persistent >/dev/null 2>&1 || true
docker volume rm demo-storage >/dev/null 2>&1 || true

echo "Création du dossier output pour le bind mount..."
mkdir -p output

echo "Création du volume nommé demo-storage..."
docker volume create demo-storage

echo "Construction de l'image demo-persistent:1.0..."
docker build -t demo-persistent:1.0 .

echo "Démarrage du conteneur avec volume nommé et bind mount..."
docker run -d --name demo-persistent -v demo-storage:/app/storage -v "$(pwd)/output:/app/output" -v "$(pwd)/config/message.txt:/app/config/message.txt:ro" demo-persistent:1.0

echo "Conteneurs en cours d'exécution :"
docker ps --filter "name=demo-persistent"

echo "Attente de 3 secondes pour l'exécution du script..."
sleep 3

echo "Journaux du conteneur :"
docker logs demo-persistent

echo "Contenu du volume nommé :"
docker exec demo-persistent ls -la /app/storage/

echo "Contenu du bind mount :"
docker exec demo-persistent ls -la /app/output/

echo "Lecture d'une donnée du volume nommé :"
docker exec demo-persistent cat /app/storage/persistent-data.txt

echo "Suppression du conteneur..."
docker rm -f demo-persistent >/dev/null 2>&1 || true

echo "Vérification que le volume existe toujours..."
docker volume ls

echo "Redémarrage avec le même volume pour vérifier la persistance..."
docker run -d --name demo-persistent-verification -v demo-storage:/app/storage alpine sh -c "cat /app/storage/persistent-data.txt && sleep 60"

echo "Conteneur de vérification créé, consulter les données :"
docker exec demo-persistent-verification cat /app/storage/persistent-data.txt

# ============================== NETTOYAGE ==============================
echo "Nettoyage du conteneur de vérification..."
docker rm -f demo-persistent-verification >/dev/null 2>&1 || true

echo "Nettoyage du conteneur principal..."
docker rm -f demo-persistent >/dev/null 2>&1 || true

echo "Nettoyage de l'image..."
docker image rm -f demo-persistent:1.0 >/dev/null 2>&1 || true

echo "Nettoyage du volume nommé..."
docker volume rm demo-storage >/dev/null 2>&1 || true

echo "Démonstration terminée."
