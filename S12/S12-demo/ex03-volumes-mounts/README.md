# Ex03 - Volumes nommés et bind mounts

## Objectif d'apprentissage
Distinguer la persistance gérée par Docker (volumes nommés) du montage de dossiers locaux (bind mounts), et démontrer que les données survivent à la suppression du conteneur.

## Progression actuelle
Ex01 et Ex02 montrent comment exécuter et construire un conteneur. Ex03 franchit une étape cruciale : la gestion de l'état au-delà du cycle de vie d'un conteneur. Les données ne doivent pas disparaître quand le conteneur est arrêté.

## Fonctionnalités couvertes
- `docker volume create`
- `docker volume ls`
- `docker volume inspect`
- `-v` volume named
- `-v` bind mount (chemin local)
- `docker run -d`
- Persistance des données
- Montage en lecture seule (`:ro`)

## Structure du dossier
```text
demo/ex03-volumes-mounts/
|-- Dockerfile
|-- README.md
|-- run-demo.ps1
|-- run-demo.sh
|-- scripts/
|   `-- collector.sh
|-- config/
|   `-- message.txt
`-- output/
```

## Étapes d'exécution sans privilèges admin

### PowerShell
```powershell
Set-Location demo/ex03-volumes-mounts
.\run-demo.ps1
```

### Bash
```bash
cd demo/ex03-volumes-mounts
chmod +x run-demo.sh
./run-demo.sh
```

## Commandes manuelles
```bash
docker volume create demo-storage
docker run -d --name demo-persistent -v demo-storage:/app/storage -v ./output:/app/output alpine sh -c "echo 'Données créées' > /app/storage/data.txt && sleep 3600"
docker exec demo-persistent cat /app/storage/data.txt
docker rm -f demo-persistent
docker run -d --name demo-persistent-2 -v demo-storage:/app/storage alpine sh -c "cat /app/storage/data.txt && sleep 3600"
docker exec demo-persistent-2 cat /app/storage/data.txt
docker volume rm demo-storage
```

## Vérification
- Créer un conteneur avec `-v demo-storage:/app/storage` et écrire une donnée
- Supprimer le conteneur
- Créer un nouveau conteneur avec le même volume
- Confirmer que la donnée a persisté
- Vérifier le dossier `./output` pour voir les fichiers du bind mount

## Résultat attendu
Vous comprenez la différence entre un volume nommé (géré par Docker, prédictible) et un bind mount (simple dossier local), et vous pouvez expliquer pourquoi il faut monter des volumes pour que les données survivent au cycle de vie du conteneur.

## Dépannage
- Volume déjà existant : `docker volume rm demo-storage`
- Conteneur déjà en cours d'exécution : `docker rm -f demo-persistent`
- Dossier `output` vide : vérifier que le script a bien créé les fichiers dans `/app/output`

## Extrait du suivi

| Exercise | Feature Covered | Technical Summary |
| --- | --- | --- |
| Ex03 | Volumes nommés, bind mounts | Compare la persistance gérée par Docker avec le montage d'un dossier local pour montrer ce qui survit à la recréation d'un conteneur. Démontre l'injection pratique de données et la conservation de l'état sur un poste Windows standard. |
