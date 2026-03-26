cls

$today = Get-Date

do{
$user = Read-Host -Prompt "Entrez une date selon le format(YYYY-MM-DD)"
$date = $user -as [datetime]

}until($date)

$dif = $today - $date 

Write-Output "$($dif.Days) jours,$($dif.Hours) heures, $($dif.Minutes) minutes , $($dif.Seconds) secondes"

