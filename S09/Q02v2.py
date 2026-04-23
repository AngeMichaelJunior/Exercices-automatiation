class Serveur:
    adresse_ip: str
    nom: str
    statut: str

    def __init__(self,adresse_ip,nom):
        self.adresse_ip = adresse_ip
        self.nom = nom
        self.statut = "arrêté"
    
    def demarrer(self):
        self.statut = "démarré"
    def arreter(self):
        self.statut = "arrêté"

    def afficher_etat(self):
        print(f'le serveur {self.nom} ,  avec l\'adresse IP {self.adresse_ip} est {self.statut}.')