class Modelisation:
    adresse_ip: str
    nom: str
    statut:str
    
    def __init__(self, adresse_ip, nom, statut):
        if (statut not in ['démarré', 'arrêté']):
            raise Exception("Paramètre invalide")
        
        try:
            self.adresse_ip = int(adresse_ip)
        except Exception as e:
            print(e)
            self.adresse_ip = 127000000001
            self.nom = nom
            self.statut = statut
        except Exception as e:
            print(f"Erreur lors de l'initialisation du serveur: {e}")
            self.statut = "démarré" #demarrer
    def arreter(self):
            self.statut = "arrêté" #arreter
            
    def afficher_etat(self):
        print(f"Le serveur {self.nom} est {self.statut} et son adresse IP est {self.adresse_ip}")
        
s = Modelisation("192.168.1.1", "Serveur1", "arrêté")
s.afficher_etat()
s.demarrer()
        
