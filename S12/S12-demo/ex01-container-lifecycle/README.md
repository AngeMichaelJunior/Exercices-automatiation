# Ex01 - Cycle de vie d'un conteneur et publication de port

## Objectif d'apprentissage
Exécuter un conteneur prêt à l'emploi, l'exposer sur un port local, inspecter son état, consulter ses journaux et contrôler son cycle de vie entièrement avec la CLI Docker.

## Progression actuelle
Cette première unité pose le vocabulaire opérationnel qui sera réutilisé dans toutes les suivantes : image, conteneur, mappage de port, journaux, arrêt, redémarrage et suppression.

## Fonctionnalités couvertes
- `docker pull`
- `docker run -d`
- publication de port avec `-p`
- `docker ps`
- `docker logs`
- `docker stop`
- `docker start`
- `docker rm`

## Structure du dossier
```text
demo/ex01-container-lifecycle/
|-- README.md
|-- run-demo.ps1
|-- run-demo.sh
`-- cleanup-demo.ps1
```

## Étapes d'exécution sans privilèges admin

### PowerShell
```powershell
Set-Location demo/ex01-container-lifecycle
.\run-demo.ps1
```

### Bash
```bash
cd demo/ex01-container-lifecycle
chmod +x run-demo.sh
./run-demo.sh
```

## Commandes manuelles
```bash
docker pull nginx:1.27-alpine
docker run -d --name demo-nginx -p 8080:80 nginx:1.27-alpine
docker ps
docker logs demo-nginx
docker stop demo-nginx
docker start demo-nginx
docker rm -f demo-nginx
```

## Vérification
- Ouvrir http://localhost:8080
- Confirmer que `demo-nginx` apparaît dans `docker ps`
- Confirmer que la page d'accueil devient inaccessible après `docker stop demo-nginx`

## Résultat attendu
Vous pouvez expliquer la différence entre une image et un conteneur, exposer un service localement et gérer le cycle de vie de base d'un conteneur détaché sans privilèges administrateur.

## Dépannage
- Port déjà utilisé : remplacer `8080:80` par `8081:80`
- Nom de conteneur déjà utilisé : exécuter `docker rm -f demo-nginx`
- Docker Desktop non démarré : ouvrir Docker Desktop avant de relancer le script

## Extrait du suivi

| Exercise | Feature Covered | Technical Summary |
| --- | --- | --- |
| Ex01 | Container lifecycle, detached mode, port publishing | Builds the first mental model of Docker by pulling and running an Nginx container in detached mode with published ports. Demonstrates basic inspection, logs, stop, restart, and removal commands in a no-admin workflow. |