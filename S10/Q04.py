import requests
import os

def telecharger_donnees():
    #doit être protégé
    cle_api = os.getenv("API_KEY")
    url = "https://api.systeme.interne/v1/export"
    
    en_tetes = {"Authorization": "Bearer " + cle_api}
    reponse = requests.get(url, headers=en_tetes)
    
    reponse.save_to_disk("/var/backups/export.json")
    print("Exportation terminée.")

if __name__ == "__main__":
    telecharger_donnees()
