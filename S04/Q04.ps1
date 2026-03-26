class Personne{
[string]$nom
[void]changerNom([string]$nouveauNom){
$this.nom = $nouveauNom
}

}

class Employe : Personne{
[string]$dateEmbauche
[double]$tauxHoraire

[void] changerTaux ([double]$nouveauTaux){
$this.tauxHoraire = $nouveauTaux
}
}

class Etudiant : Personne {
[string]$dateEntree
[string]$programme
[void]changerProgramme([string]$nouveauProgramme){
$this.programme = $nouveauProgramme
}
}



$employe1 = [Employe]::new()
$employe1.nom = "Germain"
$employe1.dateEmbauche = "2024-12-13"
$employe1.tauxHoraire = 26

$employe2 = [Employe]::new()
$employe2.nom = "Romain"
$employe2.dateEmbauche = "2026-01-11"
$employe2.tauxHoraire = 22

$etudiant1 = [Etudiant]::new()
$etudiant1.nom = "Benoit"
$etudiant1.dateEntree = "2024-08-21"
$etudiant1.programme = "Comptabilité"

$etudiant2 = [Etudiant]::new()
$etudiant2.nom = "Romuald"
$etudiant2.dateEntree = "2025-08-22"
$etudiant2.programme = "Génie mécanique"



#liste des personnes créees
$personnes = @(
$employe1
$employe2
$etudiant1
$etudiant2
)

$personnes | Format-Table