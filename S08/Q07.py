nbr_user = input("Entrez plusieurs nombre séparés par des espaces (ex: 5 10 2 20): ")

# Sépare la chaîne de caractères en une liste en utilisant l'espace comme séparateur
liste = nbr_user.split()

# Convertit chaque élément de la liste (qui est actuellement une chaîne) en entier
liste = [int(n) for n in liste]

# Trie la liste de nombres en ordre croissant
liste.sort()

# Affiche la liste triée
print(f'La liste triée est : {liste}')