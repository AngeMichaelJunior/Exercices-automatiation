# Ex07 - Health checks et politiques de redémarrage

## Objectif d'apprentissage
Ajouter des garde-fous d'exploitation aux conteneurs : health checks pour signaler l'état de santé, politiques de redémarrage automatique et limites de ressources.

## Progression actuelle
Après les optimisations d'image, cette unité ancre les conteneurs dans l'univers de la production avec surveillance active de la santé et récupération automatique.

## Fonctionnalités couvertes
- `HEALTHCHECK` dans Dockerfile
- Politiques `--restart` (on-failure:N)
- `docker inspect --format='{{json .State.Health}}'`
- Limite de ressources `--memory` et `--cpus`
- États de santé : starting, healthy, unhealthy

## Structure du dossier
```text
demo/ex07-health-checks/
|-- README.md
|-- Dockerfile
|-- index.html
|-- run-demo.ps1
|-- run-demo.sh
|-- cleanup-demo.ps1
```

## Étapes d'exécution sans privilèges admin

### PowerShell
```powershell
Set-Location demo/ex07-health-checks
.\run-demo.ps1
```

### Bash
```bash
cd demo/ex07-health-checks
chmod +x run-demo.sh
./run-demo.sh
```

## Commandes manuelles
```bash
docker build -t demo-health:1.0 .
docker run -d --name demo-health --restart=on-failure:3 demo-health:1.0
docker inspect --format='{{json .State.Health}}' demo-health
```

## Vérification
- `docker inspect --format='{{.State.Health.Status}}'` affiche "healthy"
- Les conteneurs se redémarrent automatiquement en cas d'échec
- Les limites de ressources sont appliquées

## Résultat attendu
```
Le conteneur démarre avec le health status "starting" puis passe à "healthy"
```

## Dépannage
- **Health status unknown** : attendre 30 secondes et relancer inspect
- **Redémarrage en boucle** : HEALTHCHECK peut être trop strict, ajuster les interval
- **Pas de ressources** : réduire --memory ou --cpus

## Extrait du suivi
| Exercice | Sujet |
| --- | --- |
| Ex07 | Health checks, politiques de redémarrage, limites de ressources |
| Ex08 | Reverse proxy, labels, routage dynamique |
