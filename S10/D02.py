from pathlib import Path

chemin = Path('S10/log.txt')

print(chemin.absolute())

with open(chemin, 'r') as file:
    print(file.read())