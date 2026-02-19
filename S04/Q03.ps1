cls
class Etudiant {
    [string]$nom
    [int]$age
    [string[]]$listeCours
    Etudiant([string]$nom,[int]$age,[string[]]$listeCours){
        $this.nom = $nom
        $this.age = $age
        $this.listeCours = $listeCours
    }
    
 
}
$bob = [Etudiant]::new(
    "Bob",
    20,
    @("Maths", "Philosophie", "Informatique")
)

write-host "Le nom de l etudiant est $($bob.nom), il a $($bob.age) ans et il suit les cours suivants : $($bob.listeCours -join ", ")."