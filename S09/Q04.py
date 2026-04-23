with open ('S09/config.txt', 'r') as fichier:
    for ligne in fichier:
        serveur,ip,statut = ligne.strip().split(',')

        if statut == 'ON':
            print(serveur,ip,statut)

