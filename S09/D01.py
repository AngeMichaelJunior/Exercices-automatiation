class Ordinateur:
    def __init__(self):
        pass

    def afficher(self):
        print("Ordinateur")


class Server(Ordinateur):

    def __init__(self,ip= "192.168.1.1"):
        self.ip = ip
    
    def afficher(self):
        super().afficher()
        print(f"Serveur {self.ip}")
        
        
    def __str__(self):
        return f"Serveur{self.ip}"
        
         
        s = Server()
        s.afficher()
        
        print(s)