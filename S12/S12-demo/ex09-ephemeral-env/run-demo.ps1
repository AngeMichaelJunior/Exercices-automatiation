$ErrorActionPreference = 'Stop'

Write-Host "Création du répertoire scripts si nécessaire..."
if (-not (Test-Path "scripts")) {
    New-Item -ItemType Directory -Path "scripts" -Force | Out-Null
}

Write-Host "Nettoyage des services existants..."
docker compose down --remove-orphans 2>$null | Out-Null

Write-Host "Lancement de la pile de test éphémère..."
docker compose up --abort-on-container-exit

$exitCode = $LASTEXITCODE
Write-Host "Code de sortie des tests : $exitCode"

Write-Host "État des conteneurs :"
docker compose ps -a

Write-Host "Journaux du test-runner :"
docker compose logs demo-test-runner

# ============================== NETTOYAGE ==============================
Write-Host "Arrêt et suppression des services..."
docker compose down --remove-orphans

Write-Host "Démonstration Ex09 terminée avec exit code : $exitCode"

exit $exitCode
