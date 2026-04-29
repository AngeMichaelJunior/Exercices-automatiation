#!/bin/bash

echo "Conteneur Ex03 - Démonstration des volumes"
echo "Timestamp: $(date)" >> /app/storage/volume-log.txt
echo "Montage du volume nommé : /app/storage" >> /app/storage/volume-log.txt
echo "Montage du bind mount : /app/output" >> /app/storage/volume-log.txt
echo "" >> /app/storage/volume-log.txt

echo "Écriture de données dans le volume nommé..."
echo "Données persistantes depuis un conteneur" > /app/storage/persistent-data.txt

echo "Écriture de données dans le bind mount..."
cp /app/storage/persistent-data.txt /app/output/backup-data.txt

echo "Énumération du contenu du volume..."
ls -la /app/storage/

echo "Énumération du contenu du bind mount..."
ls -la /app/output/

echo "Conteneur en attente indéfinie..."
tail -f /dev/null
