cls
$etudiant = import-csv -Path 'S06\note.csv' -Header 'nom','note' -Delimiter ';'
$topNote = 0

foreach($etudiant in $csv){
   $note =  $etudiant.note -as [float]
   #[float]::TryParse($etudiant.note,$null)
    if($note -gt 80){
        $etudiantObj = [PSCustomObject]@{
        Nom = $etudiant.nom
        note = $note.note
        }
        Write-Output "Nom : $($etudiantObj.nom) -Note : $($etudiantObj.note)"
    }
    if($note -lt $topNote){
        $topNote = $note
    }

}
Write-Output $topNote


