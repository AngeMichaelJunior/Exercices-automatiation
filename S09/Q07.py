import argparse

parser = argparse.ArgumentParser()
parser.add_argument('nombres',type=str,help="Série de nombre séparée par des espaces")
args = parser.parse_args()

# transformer la chaîne en liste
nbrConvertisEnListe = args.nombres.split()
somme = 0
moyenne = 0
mini = int(nbrConvertisEnListe[0])
maxi = int(nbrConvertisEnListe[0])



for i in nbrConvertisEnListe:
    i = int(i)
    somme += i

    if i > maxi:
        maxi = i
    if i < mini:
        mini = i
    
    moyenne = somme / len(nbrConvertisEnListe)

print(f"La somme est : {somme}")
print(f"La moyenne est : {moyenne}")
print(f"Le minimum est : {mini}")
print(f"La maximum est : {maxi}")

#exemple d'exécution : python S09/Q07.py "10 20 30 40"
