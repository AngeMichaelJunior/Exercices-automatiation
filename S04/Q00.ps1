cls
$env:PSModulePath -split ';'
$path = C:\Users\2432816\Documents\WindowsPowerShell\Modules 

test-path $path

New-ModuleManifest -path '.\S04\Q01.ps1' -Author 'Ange'

New-Item -path "$path\MyModule\MyModule.psm1" -ItemType file -force
vscode "$path\MyModule\MyModule.psm1"





