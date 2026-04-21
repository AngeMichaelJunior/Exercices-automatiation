import subprocess as sp

result = sp.run('whoammi', shell=True, capture_output=True)
# extraire adresse ip du message depuis popen
process = sp.Popen('ping google.com', shell=True, stdout=sp.PIPE, stderr=sp.PIPE,text=True)
process.wait()

adresse_ip = None

for line in process.stdout.readlines():
    print(line)

output = process.stdout.readlines()[1]
    
adresse_ip = output.strip().strip()[6][1:-1]

#regex
ip = re.findall(r'\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b', output)

print(adresse_ip)
print(ip)