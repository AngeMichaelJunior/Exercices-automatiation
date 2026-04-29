# Ex09 - Environnement de test éphémère et surcharge d'entrypoint (Annexe avancée)

## Objectif d'apprentissage
Orchestrer une pile de validation temporaire où une base de données et un conteneur test collaborent pour valider des données. Démontrer la surcharge d'entrypoint et la propagation de codes de sortie.

## Positionnement pédagogique
Cette démo est hors tronc principal. Elle vise un usage orienté automatisation et CI, après validation des bases d'exploitation Docker du parcours Ex01 à Ex07.

## Progression actuelle
Après Traefik, cette unité bascule du monde du service continu aux pipelines d'automatisation éphémères. Les conteneurs deviennent des tâches avec exit codes significatifs.

## Fonctionnalités couvertes
- Docker Compose avec surcharge d'entrypoint
- Propagation des codes de sortie
- `depends_on` pour l'ordre de démarrage
- Volumes pour partager les données entre conteneurs
- Variables d'environnement et scripts de validation

## Structure du dossier
```text
demo/ex09-ephemeral-env/
|-- README.md
|-- docker-compose.yml
|-- scripts/
|   `-- validate.sh
|-- run-demo.ps1
|-- run-demo.sh
|-- cleanup-demo.ps1
```

## Étapes d'exécution sans privilèges admin

### PowerShell
```powershell
Set-Location demo/ex09-ephemeral-env
.\run-demo.ps1
```

### Bash
```bash
cd demo/ex09-ephemeral-env
chmod +x run-demo.sh
./run-demo.sh
```

## Commandes manuelles
```bash
docker compose up --abort-on-container-exit
echo $?
docker compose down
```

## Vérification
- db conteneur démarre et s'arrête gracieusement
- test-runner valide les données et reporte exit code 0
- `docker compose up` termine avec le code de sortie du test-runner

## Résultat attendu
```
db crée des données, test-runner les valide, exit code 0 si succès
```

## Dépannage
- **Test échoue** : vérifier le script validate.sh
- **Données non partagées** : vérifier que le volume est monté sur les deux
- **Conteneurs s'arrêtent** : c'est normal, ce sont des tâches éphémères

## Extrait du suivi
| Exercice | Sujet |
| --- | --- |
| Ex09 | Environnement de test éphémère, surcharge d'entrypoint, codes de sortie |
| Ex10 | Pile d'observabilité, montages de configuration, réseaux isolés |
