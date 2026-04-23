from abc import ABC, abstractmethod
class Animal(ABC):
    nom: str
    @abstractmethod
    def parler(self):
        pass


class Chien(Animal):
    def parler(self):
        print(f"{self.nom} dit: Waouf!!")

class Chat(Animal):
    def parler(self):
        print(f"{self.nom} dit: Miaou!!")

#instance des classes
chien1 = Chien()
chien1.nom = "Rex"
chat1 = Chat()
chat1.nom = "Milou"
chien1.parler()
chat1.parler()



        

