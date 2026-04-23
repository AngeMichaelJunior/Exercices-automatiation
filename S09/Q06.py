import argparse

nombre = 0
operation = ' '
resultat = 0

# création du parser qui va analyser les arguments du terminal
parser = argparse.ArgumentParser() 

# ajout du premier argument : un nombre entier
parser.add_argument("nombre",type=int, help="un nombre entier rentré par l'utilisateur")

# ajout du deuxième argument : l'opération à effectuer# ajout du deuxième argument : l'opération à effectuer
parser.add_argument("operation",type=str, help="Doit être de type double ou binaire")

# récupération des arguments entrés par l'utilisateur
args = parser.parse_args()

# vérifie l'opération choisie par l'utilisateur
if args.operation == 'double':
     # calcule le double du nombre
    resultat = args.nombre * 2
elif args.operation == 'binaire':
    # convertit le nombre en représentation binaire
    resultat = bin(args.nombre)
else:
    # message d'erreur si l'opération n'est pas valide
    print("L'opération doit être de type double ou binaire")
    exit()

print(resultat)


#exemples d'exécution : python S09/Q06.py 10 binaire
#                      python S09/Q06.py 10 double
