$ErrorActionPreference = 'Stop'

Write-Host "Suppression du conteneur existant si nécessaire..."
docker rm -f demo-health 2>$null | Out-Null

Write-Host "Suppression de l'image existante si nécessaire..."
docker image rm -f demo-health:1.0 2>$null | Out-Null

Write-Host "Construction de l'image demo-health:1.0..."
docker build -t demo-health:1.0 .

Write-Host "Démarrage du conteneur avec health check et restart policy..."
docker run -d --name demo-health --restart=on-failure:3 -p 8097:80 demo-health:1.0

Write-Host "Attente de 5 secondes pour que le health check démarre..."
Start-Sleep -Seconds 5

Write-Host "État du health check :"
docker inspect --format='{{json .State.Health}}' demo-health | ConvertFrom-Json | Format-List

Write-Host "Informations complètes du conteneur :"
docker inspect demo-health | ConvertFrom-Json | Select-Object -Property Id, Name, State, RestartPolicy

Write-Host "Journaux du conteneur :"
docker logs --tail 10 demo-health

Write-Host "Test de réponse HTTP :"
try {
    $response = Invoke-WebRequest -Uri "http://localhost:8097" -TimeoutSec 3 -ErrorAction Stop
    Write-Host "Réponse HTTP : $($response.StatusCode)"
} catch {
    Write-Host "Attention : le serveur peut ne pas être prêt."
}

# ============================== NETTOYAGE ==============================
Write-Host "Nettoyage du conteneur demo-health..."
docker rm -f demo-health 2>$null | Out-Null

Write-Host "Nettoyage de l'image demo-health:1.0..."
docker image rm -f demo-health:1.0 2>$null | Out-Null

Write-Host "Démonstration Ex07 terminée."
