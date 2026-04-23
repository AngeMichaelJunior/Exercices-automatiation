import argparse

parser = argparse.ArgumentParser()
#le fichier à analyser
parser.add_argument('fichier', help='Fichier à analyser')
# options (flags) pour choisir quoi compter
parser.add_argument('--lignes' , action="store_true", help='Pour afficher le nombre de ligne')
parser.add_argument('--mots',action="store_true", help='Pour afficher le nombre de mot')
parser.add_argument('--caracteres', action="store_true", help='Pour afficher le nombre de caractères')

args = parser.parse_args()

# ouverture du fichier donné par l'utilisateur
with open(args.fichier, "r") as fichier:
    contenu = fichier.read()      # lire tout le contenu du fichier
    lignes = contenu.splitlines() # liste de lignes
        
if args.lignes:
    print(f"Nombre de lignes : {len(lignes)}")
if args.mots:
    print(f"Nombre de mots : {len(contenu.split())}")
if args.caracteres:
    print(f"Nombre de caractères : {len(contenu)}")


#exemple d'exécution : python S09/Q08.py S09/fichier.txt --lignes