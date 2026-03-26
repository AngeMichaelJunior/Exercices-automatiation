#########################
#Gestion des processus
#########################

#Afficher les processus débutant par win
Get-Process win*

#Afficher le nom et l’état (Responding) des processus
Get-Process | Select-Object Name, Responding

#Afficher le nom et l’état des processus qui ne répondent pas
Get-Process | Where-Object {$_.Responding -eq $false} | Select-Object Name, Responding

#Arrêter les processus qui ne répondent pas
Get-Process | Where-Object {$_.Responding -eq $false} | Stop-Process


#########################
#Système de fichiers
#########################

#Créer un dossier dans C:\temp
New-Item -Path C:\temp\MonDossier -ItemType Directory

#Copier un fichier dans ce dossier
Copy-Item C:\Windows\notepad.exe -Destination C:\temp\MonDossier

#Donner des droits à un utilisateur avec icacls
icacls C:\temp\MonDossier\notepad.exe /grant utilisateur:F


#########################
#Système Windows
#########################

#Afficher les informations sur l’ordinateur
Get-ComputerInfo

#Obtenir les informations des cartes réseau
Get-NetAdapter

#Lister les disques durs
Get-Disk

