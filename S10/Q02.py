#Écris un script qui surveille un fichier de log (/var/log/syslog ou un fichier local) et affiche les nouvelles lignes ajouter au fichier en temps réel.

import time
def monitor_log_file(file_path):
    with open(file_path, 'r') as file:
        # Se positionner à la fin du fichier
        file.seek(0, 2)
        while True:
            # Lire une nouvelle ligne
            line = file.readline()
            if line:
                print(line, end='')  # Afficher la nouvelle ligne sans ajouter de nouvelle ligne supplémentaire
            else:
                time.sleep(0.1)  # Attendre un peu avant de vérifier à nouveau
