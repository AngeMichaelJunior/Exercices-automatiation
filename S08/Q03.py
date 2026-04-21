mot ='egnA'
inverse = ''

for lettre in mot:
    inverse = lettre + inverse
print(inverse)



#généré par IA
texte = input("Entrez du texte")

for i in texte:
   texte_inversre = texte[::-1]
print(texte_inversre)
