import pathlib
resultat = None
def trouver_motif(chemin_fichier, motif):
    try:
        with open(chemin_fichier, 'r') as fichier:
            for index_ligne, ligne in enumerate(fichier):
                index_colonne = ligne.find(motif)
                if index_colonne != -1:
                   resultat = f"Motif trouvé à la ligne {index_ligne + 1}, colonne {index_colonne + 1}"
                   print(resultat)  
    except FileNotFoundError:
        print("File not found")
    
if __name__ == "__main__":
    trouver_motif("file.txt", "erreur") 


#correction prof
def trouver_motif(chemin, motif):
    try:
        with open(chemin, 'r') as file:
            n=1
            for line in file:
                pos = line.find(motif)
                if pos != -1:
                    print(f'Line {n}: {pos}')      
                n+=1
                           
    except FileNotFoundError:
        print("Le fichier n\'a pas été trouvé")
        
if __name__ == "__main__":
    trouver_motif("file.txt", "545")