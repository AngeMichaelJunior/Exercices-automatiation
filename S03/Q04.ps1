
cls
$profileUser = Get-ChildItem -Path "C:\Users" -Directory


foreach($i in $profileUser){
$obj = [PSCustomObject]@{
NomUtilisateur = $i.Name
CheminProfil = $i.FullName
}
Write-Output $obj 

}
