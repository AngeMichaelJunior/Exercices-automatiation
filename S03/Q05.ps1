#terminer par les paramètres
[CmdletBinding()]
param (
    [Parameter(Mandatory=$true,
    valueFromPipeline=$true,
    valueFromPipelineByPropertyName=$true)]
    [validateScript({$_ -ge 0})]
    [int]$decimal
)

#La section "param" définit les paramètres que le script accepte. 
#Ici, il y a un paramètre obligatoire nommé "decimal" de type entier.
# Cela signifie que lorsque vous exécutez le script, 
#vous devez fournir une valeur pour ce paramètre, et cette valeur doit être un nombre entier.



#convertir un nombre décimal en binaire avec boucle et modulo
clear
$decimal = Read-Host "Entrez un nombre decimal"
$binary = ""
while ($decimal -gt 0) {
    $convertion = $decimal % 2
    $binary = $convertion.ToString() + $binary
    $decimal = [math]::Floor($decimal / 2)
}
Write-Host "Le nombre binaire est: $binary"