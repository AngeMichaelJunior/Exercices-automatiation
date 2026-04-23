
import os 

source = r"C:\Users\2432816\OneDrive - Cégep Limoilou" #le r avant le chemin indique que c'est une raw string, ce qui permet d'éviter les problèmes d'échappement des caractères spéciaux comme les backslashes.

for racine,dossiers,fichiers in os.walk(source): # os.walk() est une fonction qui génère les noms de fichiers dans un répertoire donné en parcourant l'arborescence du répertoire de manière récursive. Elle retourne un tuple (racine, dossiers, fichiers) pour chaque répertoire visité.
    for fichier in fichiers:
        if fichier.endswith(".pdf"):  #endswith() est une méthode de chaîne de caractères qui vérifie si la chaîne se termine par un suffixe spécifié. Dans ce cas, elle vérifie si le nom du fichier se termine par ".pdf", ce qui permet de filtrer les fichiers PDF.
            #chemin_abs = os.path.join(racine,fichier) # os.path.join() est une fonction qui concatène les différentes parties d'un chemin de fichier en utilisant le séparateur de chemin approprié pour le système d'exploitation. Elle prend en compte les différents formats de chemins (par exemple, les barres obliques pour Unix/Linux et les backslashes pour Windows) et garantit que le chemin résultant est correct.
            #print(chemin_abs)           
            print(fichier)
            print('-------------------------------')


