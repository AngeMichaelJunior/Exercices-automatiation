#!/bin/sh

echo "Démarrage de la validation..."
sleep 2

if [ -f /data/testfile.txt ]; then
    echo "Fichier trouvé : /data/testfile.txt"
    CONTENT=$(cat /data/testfile.txt)
    echo "Contenu : $CONTENT"
    
    if [ "$CONTENT" = "test_data_value_42" ]; then
        echo "Validation réussie : la donnée correspond."
        exit 0
    else
        echo "Erreur : contenu inattendu."
        exit 1
    fi
else
    echo "Erreur : fichier /data/testfile.txt non trouvé."
    exit 1
fi
