def additionner(a:int,b:int) -> int:
    """
    Cette fonction retourne la somme de 
    deux entiers passés en paramètre.
    """
    somme = a + b
    return somme
help(additionner)

resultat = additionner(5, 7)
print(resultat)