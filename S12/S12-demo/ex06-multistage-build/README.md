# Ex06 - Builds multi-étapes et optimisation d'image

## Objectif d'apprentissage
Utiliser un Dockerfile multi-étapes pour séparer les outils de compilation des artefacts d'exécution. Réduire la taille finale de l'image et sa surface d'attaque.

## Progression actuelle
Après Docker Compose, cette unité approfondissait la construction d'images en montrant comment un seul Dockerfile peut émettre une image optimisée sans dépôts de dépendances.

## Fonctionnalités couvertes
- Syntax multi-stage avec `FROM ... AS`
- `COPY --from=<stage>`
- Réduction de la taille d'image (couche de compilation vs. couche de runtime)
- `docker image history` pour inspecter les couches
- `docker image inspect` pour les métadonnées

## Structure du dossier
```text
demo/ex06-multistage-build/
|-- README.md
|-- Dockerfile
|-- run-demo.ps1
|-- run-demo.sh
|-- cleanup-demo.ps1
```

## Étapes d'exécution sans privilèges admin

### PowerShell
```powershell
Set-Location demo/ex06-multistage-build
.\run-demo.ps1
```

### Bash
```bash
cd demo/ex06-multistage-build
chmod +x run-demo.sh
./run-demo.sh
```

## Commandes manuelles
```bash
docker build -t demo-multistage:1.0 .
docker image history demo-multistage:1.0
docker image inspect demo-multistage:1.0
docker run -d --name demo-multistage -p 8096:80 demo-multistage:1.0
```

## Vérification
- `docker image history` montre 2-3 étapes (builder, runtime)
- L'image finale est plus petite que si tous les outils étaient inclus
- `http://localhost:8096` affiche le contenu généré en stage 1

## Résultat attendu
```
Stage 1 (builder) crée hello.txt
Stage 2 (runtime) copie hello.txt et le sert via Nginx
```

## Dépannage
- **Erreur build** : vérifier que Dockerfile utilise `COPY --from=builder`
- **Fichier hello.txt manquant** : stage 1 doit créer `/tmp/hello.txt`
- **Nginx ne démarre pas** : vérifier la syntaxe CMD

## Extrait du suivi
| Exercice | Sujet |
| --- | --- |
| Ex06 | Builds multi-étapes |
| Ex07 | Health checks, politiques de redémarrage, limites de ressources |
