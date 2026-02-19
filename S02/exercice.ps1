#chemin du fichier source
$source = join-Path $PSScriptRoot "config.txt"

#Dossier de destination(dossier utilisateur)
$destination = $HOME

#Copier le fichier config.txt vers le dossier utilisateur
Copy-Item -Path $source -Destination $destination 