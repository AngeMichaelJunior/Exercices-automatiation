import time
with open("S10/file.log", "r") as fichier:
    fichier.seek(0,2) # Se positionner à la fin du fichier

    while True:
        ligne = fichier.readline()
        if ligne == "": # Si aucune ligne n'est lue, cela signifie que nous sommes à la fin du fichier
            time.sleep(1) # Attendre un peu avant de vérifier à nouveau
        else:
            print(ligne,"") # Afficher la ligne lue (en ajoutant une nouvelle ligne pour éviter les retours à la ligne supplémentaires)
