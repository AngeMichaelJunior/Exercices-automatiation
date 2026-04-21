mot_user = str(input('Entrez un mot pour connaitre le nombre de voyelle qu\'il contient : '))
voyelle = ['a','e','i','o','u','y']
nbr_voyelles = 0

for lettre in mot_user:
    if lettre in voyelle:
        nbr_voyelles += 1
print(f'il y a {nbr_voyelles} voyelle dans le mot {mot_user}.')

    
