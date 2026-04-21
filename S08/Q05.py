while True:
    nombre_user = int(input("Entrez un nombre entre 1 et 10: "))

    if (nombre_user < 0 or nombre_user > 10):
        print("Nombre invalide !")
    else:
        print(f'ton nombre {nombre_user} est valide.')
        break