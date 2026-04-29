# Ex02 - Construire une image Docker personnalisée

## Objectif d'apprentissage
Créer une image web personnalisée à partir d'un Dockerfile, comprendre les instructions de base qui produisent des couches et exécuter cette image localement.

## Progression actuelle
Ex01 a montré comment exécuter une image existante. Ex02 fait le saut suivant : produire notre propre image, modifier son contenu, puis l'exécuter comme une image standard.

## Fonctionnalités couvertes
- `Dockerfile`
- `FROM`
- `WORKDIR`
- `COPY`
- `CMD`
- `docker build`
- `docker image history`
- `docker run -d`

## Structure du dossier
```text
demo/ex02-custom-image/
|-- Dockerfile
|-- README.md
|-- run-demo.ps1
|-- run-demo.sh
`-- site/
    `-- index.html
```

## Étapes d'exécution sans privilèges admin

### PowerShell
```powershell
Set-Location demo/ex02-custom-image
.\run-demo.ps1
```

### Bash
```bash
cd demo/ex02-custom-image
chmod +x run-demo.sh
./run-demo.sh
```

## Commandes manuelles
```bash
docker rm -f demo-custom-web
docker build -t demo-custom-web:1.0 .
docker image history demo-custom-web:1.0
docker run -d --name demo-custom-web -p 8090:80 demo-custom-web:1.0
docker ps
docker logs demo-custom-web
docker rm -f demo-custom-web
docker image rm -f demo-custom-web:1.0
```

## Vérification
- Ouvrir http://localhost:8090
- Confirmer que la page affichée provient du fichier local `site/index.html`
- Exécuter `docker image history demo-custom-web:1.0` et repérer les couches liées au Dockerfile

## Résultat attendu
Vous pouvez expliquer le rôle de `FROM`, `WORKDIR`, `COPY` et `CMD`, construire une image locale et l'exécuter comme n'importe quelle image téléchargée depuis un registre.

Le script de démonstration effectue aussi le nettoyage à la fin en supprimant le conteneur et l'image locale pour laisser l'environnement propre.

## Dépannage
- Port déjà utilisé : remplacer `8090:80` par `8091:80`
- Ancien conteneur encore présent : exécuter `docker rm -f demo-custom-web`
- Build interrompu : vérifier que Docker Desktop est démarré et que le fichier `site/index.html` existe

## Extrait du suivi

| Exercise | Feature Covered | Technical Summary |
| --- | --- | --- |
| Ex01 | Cycle de vie d'un conteneur, mode détaché, publication de port | Construit le premier modèle mental de Docker en téléchargeant puis en exécutant un conteneur Nginx en arrière-plan avec un port publié. Montre l'inspection de base, les journaux, l'arrêt, le redémarrage et la suppression dans un flux sans privilèges admin. |
| Ex02 | Dockerfile, construction d'image, couches | Crée une image personnalisée avec `FROM`, `WORKDIR`, `COPY` et `CMD` pour expliquer comment les couches sont produites et réutilisées. Montre le passage d'un dossier source vers une image exécutable sans installation locale supplémentaire. |