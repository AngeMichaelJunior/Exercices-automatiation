
from pathlib import Path

chemin = Path('.')
taille_total = 0
taille_max = 0
fichier_max = ''
for racine,dossier,fichiers in chemin.walk():
        for fichier in fichiers:
            fichier = racine / fichier
            taille_fichier = fichier.stats().st_size
            
            taille_total += taille_fichier
            if taille_fichier > taille_max:
                taille_max = taille_fichier
                fichier_max = fichier
print(f'Taille totale : {taille_total / 1024:.2f} Ko')
print(f'Fichier le plus lourd : {fichier_max} ({taille_max / 1024:.2f} Ko)')






