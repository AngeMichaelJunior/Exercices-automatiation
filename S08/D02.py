#print('Hello World' , end = ' ')
#print('test' , end = ' ')


#nom = input ('Quel est votre nom ? ')
#
# print('Bonjour ' + nom)



#Demander à un utilisateur d'entrer un nombre entre 1 et 10
#inclusiveent , retourner un message d'erreur si le nombre n'est pas dans la plage et recommencer
#jusque ce que l'utilisateur entre un nombre valide
while (True):
    nombre = int (input('Entrez un nombre entre 1 et 10 : '))
    if nombre >= 1 and nombre <= 10:
        print('Vous avez rentré le nombre ' + str(nombre))
        break
    else:
        print('Nombre invalide !!')
        
        
    #list
m = ['fax',412,True]
print(m[0])

p = ['ttt']
print(m * 3)

init = [0] * 10
print(init)