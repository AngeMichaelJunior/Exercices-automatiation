from pathlib import Path
CHEMIN_DOSSIER_PERSONNEL = "C:/Users/2432816/OneDrive - Cégep Limoilou"

for racine, dossiers, fichiers in Path(CHEMIN_DOSSIER_PERSONNEL).walk():
    print('------------------------------------------------------------------------------------------------------------------------------')
    print(racine)
    