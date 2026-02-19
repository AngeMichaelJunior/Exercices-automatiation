
clear
$trouves = 0
$n = 2

while ($trouves -lt 100) {

    $estPremier = $true

    for ($i = 2; $i -lt $n; $i++) {
        if ($n % $i -eq 0) {
            $estPremier = $false
            break
        }
    }

    if ($estPremier) {
        Write-Host $n
        $trouves++
    }

    $n++
}