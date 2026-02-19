cls
class personne{
    hidden [string]$nom
    [void] changerNom([string]$nouveauNom){
        $this.nom = $nouveauNom
    }

}

class employe : personne{
    $taux

    changerTaux($nouveauTaux){
        $this.taux = $nouveauTaux
    }
  
 }


$p = [personne]::new()
$p.nom = "Bob"
$p.changerNom("Karl")
#$p.changerTaux(10)
write-host "Nom: $($p.nom)"