import argparse

parser =  argparse.ArgumentParser(description="Un exemple avec argparse.")

parser.add_argument("nom", type="str", help="Votre nom")
parser.add_argument("--age", type=int , help= "Votre âge(optionnel)")

args = parser.parse_args()

print(args)

print(f"Bonjour {args.nom} !")
if args.age:
    print(f"Vous avez {args.age} ans.")