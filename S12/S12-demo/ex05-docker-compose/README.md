# Ex05 - Docker Compose et orchestration déclarative

## Objectif d'apprentissage
Remplacer les commandes Docker impératives par une configuration déclarative avec `docker-compose.yml`. Orchestrer plusieurs services, gérer les dépendances et les variables d'environnement.

## Progression actuelle
Après les réseaux, cette unité introduit le paradigme infrastructure-as-code où les services sont définis dans un fichier YAML réutilisable et versionnable.

## Fonctionnalités couvertes
- `docker-compose.yml` version 3.9+
- Services multiples (db, web)
- Variables d'environnement
- `depends_on` et ordre de démarrage
- Ports publiés et ports internes
- `docker compose up/down/logs/ps`

## Structure du dossier
```text
demo/ex05-docker-compose/
|-- README.md
|-- docker-compose.yml
|-- run-demo.ps1
|-- run-demo.sh
`-- cleanup-demo.ps1
```

## Étapes d'exécution sans privilèges admin

### PowerShell
```powershell
Set-Location demo/ex05-docker-compose
.\run-demo.ps1
```

### Bash
```bash
cd demo/ex05-docker-compose
chmod +x run-demo.sh
./run-demo.sh
```

## Commandes manuelles
```bash
docker compose up -d
docker compose ps
docker compose logs web
docker compose down
```

## Vérification
- `docker compose ps` affiche 2 services (db, web)
- `docker compose logs web` montre les journaux de Nginx
- `http://localhost:8095` est accessible
- `docker compose down` supprime les conteneurs et le réseau

## Résultat attendu
```
db est en cours d'exécution avec busybox
web est accessible sur http://localhost:8095
les logs montrent les services en activité
```

## Dépannage
- **Port déjà utilisé** : modifier 8095 dans docker-compose.yml
- **Compose command not found** : installer Docker Desktop ou Docker Compose CLI
- **Services n'apparaissent pas** : lancer `docker compose up -d` depuis le bon dossier

## Extrait du suivi
| Exercice | Sujet |
| --- | --- |
| Ex05 | Docker Compose, variables d'environnement, dépendances |
| Ex06 | Builds multi-étapes |
