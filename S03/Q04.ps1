

#Récupérer la liste des profils locaux
$profiles = Get-ChildItem -Path "C:\Users" -Directory
#Afficher les profils locaux
foreach ($profile in $profiles) {
    Write-Output "nom de l'utilisateur : $profile | chemin du profil : $($profile.FullName)"
}

