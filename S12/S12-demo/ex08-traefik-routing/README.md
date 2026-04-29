# Ex08 - Reverse proxy Traefik et routage dynamique (Annexe avancée)

## Objectif d'apprentissage
Utiliser Traefik comme reverse proxy pour router automatiquement les requêtes HTTP vers plusieurs services basés sur des labels Docker. Démontrer la découverte dynamique de services.

## Positionnement pédagogique
Cette démo est hors tronc principal. Elle s'adresse aux groupes qui ont déjà validé Ex01 à Ex07 et souhaitent approfondir le routage multi-services avancé.

## Progression actuelle
Après les health checks, cette unité expose comment découpler la couche réseau de la couche applicative avec un proxy intelligent. Les labels Docker pilotent le routage sans intervention manuelle.

## Fonctionnalités couvertes
- Docker Compose avec Traefik
- Labels : `traefik.enable`, `traefik.http.routers`, `traefik.http.services`
- Dashboard Traefik sur port 8090
- Routage par hostname ou path
- Auto-discovery de services

## Structure du dossier
```text
demo/ex08-traefik-routing/
|-- README.md
|-- docker-compose.yml
|-- run-demo.ps1
|-- run-demo.sh
|-- cleanup-demo.ps1
```

## Étapes d'exécution sans privilèges admin

### PowerShell
```powershell
Set-Location demo/ex08-traefik-routing
.\run-demo.ps1
```

### Bash
```bash
cd demo/ex08-traefik-routing
chmod +x run-demo.sh
./run-demo.sh
```

## Commandes manuelles
```bash
docker compose up -d
curl http://localhost:8090/dashboard/
curl http://localhost:8080/service1
curl http://localhost:8080/service2
docker compose down
```

## Vérification
- Dashboard Traefik accessible sur http://localhost:8090
- Traefik découvre les 2 services web automatiquement
- Chaque service est routé correctement

## Résultat attendu
```
Traefik affiche les routes pour demo-web1 et demo-web2
Les curl vers http://localhost:8080 routent correctement
```

## Dépannage
- **Port 8080 déjà utilisé** : modifier dans docker-compose.yml
- **Services non découverts** : vérifier les labels traefik.enable=true
- **Dashboard inaccessible** : attendre 5 secondes après démarrage

## Extrait du suivi
| Exercice | Sujet |
| --- | --- |
| Ex08 | Reverse proxy, labels, routage dynamique |
| Ex09 | Environnement de test éphémère, surcharge d'entrypoint, codes de sortie |
