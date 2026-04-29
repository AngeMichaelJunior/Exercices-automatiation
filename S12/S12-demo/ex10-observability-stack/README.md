# Ex10 - Pile d'observabilité avec Prometheus et Grafana (Annexe avancée)

## Objectif d'apprentissage
Assembler une pile d'observabilité complète avec Prometheus (collecte de métriques), Grafana (visualisation) et node-exporter (exportateur de métriques). Démontrer les montages de configuration en lecture seule et la supervision multi-services.

## Positionnement pédagogique
Cette démo est hors tronc principal. Elle est proposée en approfondissement pour les groupes qui veulent aller vers des pratiques d'exploitation avancées.

## Progression actuelle
Dernier exercice : cette unité synthétise tous les concepts précédents (Compose, réseaux, labels, health checks) dans un laboratoire d'observabilité de production. Montre comment surveiller l'infrastructure elle-même.

## Fonctionnalités couvertes
- Docker Compose avec 3 services
- Prometheus sur port 9090
- Grafana sur port 3000
- node-exporter pour les métriques système
- Montages de configuration en lecture seule (`:ro`)
- Réseaux isolés
- Variables d'environnement pour Grafana

## Structure du dossier
```text
demo/ex10-observability-stack/
|-- README.md
|-- docker-compose.yml
|-- config/
|   |-- prometheus.yml
|   `-- datasource.json
|-- run-demo.ps1
|-- run-demo.sh
|-- cleanup-demo.ps1
```

## Étapes d'exécution sans privilèges admin

### PowerShell
```powershell
Set-Location demo/ex10-observability-stack
.\run-demo.ps1
```

### Bash
```bash
cd demo/ex10-observability-stack
chmod +x run-demo.sh
./run-demo.sh
```

## Commandes manuelles
```bash
docker compose up -d
curl http://localhost:9090/api/v1/query?query=up
curl http://localhost:3000/api/datasources
docker compose down
```

## Vérification
- Prometheus accessible sur http://localhost:9090
- Grafana accessible sur http://localhost:3000 (admin/admin)
- Node-exporter exporte des métriques
- Datasource Prometheus est pré-configurée dans Grafana

## Résultat attendu
```
Prometheus collecte les métriques de node-exporter
Grafana affiche les données avec la datasource pré-configurée
```

## Dépannage
- **Port 9090 déjà utilisé** : modifier dans docker-compose.yml
- **Grafana sans datasource** : vérifier le fichier datasource.json
- **Pas de métriques** : vérifier que node-exporter est running

## Extrait du suivi
| Exercice | Sujet |
| --- | --- |
| Ex09 | Environnement de test éphémère, surcharge d'entrypoint, codes de sortie |
| Ex10 | Pile d'observabilité, montages de configuration, réseaux isolés |
