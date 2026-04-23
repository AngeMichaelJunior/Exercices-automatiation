#correction de chatGPT
import requests
import os

def telecharger_donnees():
    
    # ⚠️ CORRECTION 1 : ne pas stocker la clé API directement dans le code
    # On récupère la clé API à partir d'une variable d'environnement
    # Cela évite d'exposer des informations sensibles dans le script
    cle_api = os.getenv("API_KEY")

    # Vérification : si la clé API n'existe pas, on arrête le programme
    if cle_api is None:
        print("Erreur : la variable d'environnement API_KEY n'est pas définie.")
        return

    # URL de l'API interne
    url = "https://api.systeme.interne/v1/export"

    # Création de l'en-tête d'authentification pour l'API
    en_tetes = {
        "Authorization": "Bearer " + cle_api
    }

    # Envoi de la requête HTTP GET à l'API
    reponse = requests.get(url, headers=en_tetes)

    # Vérification que la requête HTTP a réussi
    if reponse.status_code == 200:

        # ⚠️ CORRECTION 2 : la méthode save_to_disk() n'existe pas dans la bibliothèque requests
        # On doit donc sauvegarder la réponse manuellement dans un fichier

        # Ouverture du fichier en mode écriture binaire
        with open("/var/backups/export.json", "wb") as fichier:

            # Écriture du contenu de la réponse dans le fichier
            fichier.write(reponse.content)

        print("Exportation terminée.")

    else:
        # Gestion simple des erreurs HTTP
        print("Erreur lors de la requête :", reponse.status_code)


# Point d'entrée du programme
if __name__ == "__main__":
    telecharger_donnees()