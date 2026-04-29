import argparse
import os

parser = argparse.ArgumentParser()

parser.add_argument("dossier",help="Dossier à analyser")

args = parser.parse_args()

nbr_fichier = 0
plus_gros = 0
nom_plusGros = ""
taille_totale = 0

for racine,dossiers,fichiers in os.walk(args.dossier):
    for f in fichiers:
        nbr_fichier += 1
        chemin_fichier = os.path.join(racine,f)
        taille_fichier = os.path.getsize(chemin_fichier)
        if taille_fichier > plus_gros:
            plus_gros = taille_fichier
            nom_plusGros = chemin_fichier
        taille_totale += taille_fichier

print(f"Nombre de fichiers : {nbr_fichier}")
print(f"Fichier le plus gros : {nom_plusGros} ({plus_gros} octets)")
print(f"Taille totale : {taille_totale} octets")


#exemple test : python S10/Q05v2.py S08



