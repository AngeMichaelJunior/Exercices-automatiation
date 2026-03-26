class Voiture {
    [string]$numeroSerie
    [int]$anneeFabrication
    [string]$marque
    [string]$modele

    Voiture([string]$num, [int]$annee, [string]$marque, [string]$modele){
        $this.numeroSerie = $num
        $this.anneeFabrication = $annee
        $this.marque = $marque
        $this.modele = $modele
    }
}

$maVoiture = [Voiture]::new("ABC2026", 2026, "Mercedes", "Benz")

$maVoiture