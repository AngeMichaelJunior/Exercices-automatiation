from Q02v2 import Serveur

# création de plusieurs serveurs
serveur1 = Serveur("192.168.1.10", "Web")
serveur2 = Serveur("192.168.1.20", "BaseDeDonnees")

# afficher l'état initial
serveur1.afficher_etat()
serveur2.afficher_etat()

# démarrer les serveurs
serveur1.demarrer()
serveur2.demarrer()

# afficher l'état après démarrage
serveur1.afficher_etat()
serveur2.afficher_etat()

# arrêter un serveur
serveur2.arreter()

# afficher l'état final
serveur2.afficher_etat()