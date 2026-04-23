#écrire dans le fichier
with open('S09/fichier.txt', 'w') as fichier:
    fichier.write("Bonjour,\n")
    fichier.write('je suis Ange Michael.\n')
    fichier.write('j\'étudie au cegep Limoilou.\n')
    fichier.write('j\'ai 21 ans.\n')

#lire le fichier
try:
    with open('S09/fichier.txt', 'r') as fichier:
        contenu = fichier.read()
        print(contenu)   
except FileNotFoundError:
    print("File not found")


    




