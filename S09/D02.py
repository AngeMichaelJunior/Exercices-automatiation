#lire un fichier
try:
    with open('file.txt', 'r') as file:
        content = file.read()
        print(content)
except FileNotFoundError:
    print("File not found")

#lire le fihcier ligne par ligne

try:
    with open('file.txt', 'r') as file:
       while True:
           content = file.readline()
           if not content:
                break
            print(content)
except FileNotFoundError:
    print("File not found")
