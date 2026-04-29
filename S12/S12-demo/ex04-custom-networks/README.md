# Ex04 - Réseaux personnalisés et DNS entre conteneurs

## Objectif d'apprentissage
Créer un réseau bridge personnalisé et démontrer comment les conteneurs peuvent se découvrir par nom DNS plutôt que par adresse IP.

## Progression actuelle
Après avoir manipulé les cycles de vie, les images et les volumes, cette unité introduit la couche réseau multi-conteneurs. Les réseaux personnalisés activent la découverte de services par DNS interne.

## Fonctionnalités couvertes
- `docker network create` avec driver bridge
- Connexion de conteneurs à un réseau nommé
- DNS interne (résolution par nom de conteneur)
- `docker network inspect`
- Communication interconteneur par nom

## Structure du dossier
```text
demo/ex04-custom-networks/
|-- README.md
|-- run-demo.ps1
|-- run-demo.sh
|-- cleanup-demo.ps1
```

## Étapes d'exécution sans privilèges admin

### PowerShell
```powershell
Set-Location demo/ex04-custom-networks
.\run-demo.ps1
```

### Bash
```bash
cd demo/ex04-custom-networks
chmod +x run-demo.sh
./run-demo.sh
```

## Commandes manuelles
```bash
docker network create demo-network
docker run -d --name demo-web --network demo-network nginx:1.27-alpine
docker run -it --name demo-client --network demo-network busybox
# À l'intérieur du client : ping demo-web
docker network inspect demo-network
```

## Vérification
- Depuis le conteneur client, `ping demo-web` doit rendre des réponses (DNS résolu)
- `docker network inspect demo-network` affiche les deux conteneurs connectés
- Les conteneurs sont isolés d'autres réseaux

## Résultat attendu
```
demo-web a reçu 4 packets depuis demo-client par son nom DNS
```

## Dépannage
- **Ping échoue** : vérifier que les deux conteneurs sont sur le même réseau avec `docker network inspect demo-network`
- **Conteneur client s'arrête** : c'est normal, busybox sort après le ping
- **Réseau déjà existant** : le script le supprime avant de le recréer

## Extrait du suivi
| Exercice | Sujet |
| --- | --- |
| Ex04 | Réseaux personnalisés, DNS entre conteneurs |
| Ex05 | Docker Compose, variables d'environnement, dépendances |
