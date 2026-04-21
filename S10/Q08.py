import argparse

parser = argparse.ArgumentParser()


parser.add_argument('nombre',type=int)
parser.add_argument('operation',type=str, choices=['double', 'binaire'])
args = parser.parse_args()
#nombre = 10
#operation = 'double'
nombre = args.nombre 
operation = args.operation

if operation == 'double':
    print(nombre * 2)
elif operation == 'binaire':
    print(bin(nombre)[2:])
    
    #Exemple test : python .\S10\Q08.py 10 binaire  