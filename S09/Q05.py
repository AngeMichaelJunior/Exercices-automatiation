nbr_user = input("Rentrez une série de nombres séparés par des virgules: ")
nbr_convertisEnListe = nbr_user.split(",")
somme = 0
moyenne = 0
maxi = int(nbr_convertisEnListe[0]) 
mini = int(nbr_convertisEnListe[0])  #si on initialise à 0, si tous les nombres sont positifs
                                     #et différents de 0 , le minimum restera à 0. Pareil pour le maximum
for i in nbr_convertisEnListe:
    i = int(i)
    somme += i
    if i > maxi:
        maxi = i
    if i < mini:
        mini = i

moyenne = somme /len(nbr_convertisEnListe)
print(f'La somme est : {somme}')
print(f'La moyenne est : {moyenne}')
print(f'Le maximum est : {maxi}')
print(f'Le minimum est : {mini}')