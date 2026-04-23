def trouver_motif(chemin_fichier, motif):
    try:
        with open(chemin_fichier, "r") as fichier:
            for index_ligne, ligne in enumerate(fichier): #enumarate pour obtenir l'index de la ligne et le contenu de la ligne
                index_colonne = ligne.find(motif) #find retourne l'index de la première occurrence du motif dans la ligne, ou -1 si le motif n'est pas trouvé

                if index_colonne != -1:
                    return (index_ligne, index_colonne) #retourne un tuple contenant l'index de la ligne et l'index de la colonne où le motif a été trouvé

        return None #retourne None si le motif n'est pas trouvé dans le fichier

    except FileNotFoundError:
        print("Erreur : le fichier est introuvable.")
        return None

    except PermissionError:
        print("Erreur : permission refusée pour accéder au fichier.")
        return None


if __name__ == "__main__":
    resultat = trouver_motif("file.txt", "erreur")
    print(resultat)