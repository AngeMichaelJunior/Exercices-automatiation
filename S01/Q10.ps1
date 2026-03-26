cls  

# Récupère le chemin courant 
$chemin = Get-Location

# Boucle de 1 à 15 pour créer 15 semaines
foreach($i in 1..15){

    # Convertit le numéro en format 2 chiffres 
    $numero = $i.ToString("00")

    # Crée le nom du dossier semaine (ex: "semaine 01")
    $dossierSemaine = "semaine " + $numero 

    # Construit le chemin complet du dossier semaine
    $cheminSemaine = Join-Path $chemin $dossierSemaine

    # Nom du dossier de notes
    $Note = "Note_de_cours"

    # Chemin complet du dossier de notes
    $CheminNote = Join-Path $cheminSemaine $Note

    # Nom du dossier des travaux
    $Travaux = "Travaux"

    # Chemin complet du dossier des travaux
    $cheminTravaux = Join-Path $cheminSemaine $Travaux

    # Chemin complet du fichier note.md à créer dans Note_de_cours
    $cheminFichier = Join-Path $CheminNote "note.md"

    # Crée le dossier semaine
    New-Item -ItemType Directory -Path $cheminSemaine
    Write-Host "Création du dossier dans $cheminSemaine"

    # Crée le dossier Note_de_cours
    New-Item -ItemType Directory -Path $CheminNote
    Write-Host "Création du dossier Note_de_cours dans $cheminNote"

    # Crée le dossier Travaux
    New-Item -ItemType Directory -Path $cheminTravaux 
    Write-Host "Création du dossier Travaux dans $cheminTravaux"

    # Crée le fichier note.md
    New-Item -ItemType File -Path $cheminFichier
    Write-Host "Création du fichier note.md dans $cheminFichier"
}