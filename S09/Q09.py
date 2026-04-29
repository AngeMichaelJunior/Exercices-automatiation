import argparse

parser = argparse.ArgumentParser(description="Compter les mots par ligne")
parser.add_argument("fichier", type=str, help="Nom du fichier texte")

args = parser.parse_args()

with open(args.fichier, "r") as f:
    lignes = f.readlines()

for i, ligne in enumerate(lignes, start=1): # numérote les lignes à partir de 1
    mots = ligne.split()
    print(f"Ligne {i} : {len(mots)} mots")

#exemple d'exécution : python S09/Q09.py S09/fichier.txt