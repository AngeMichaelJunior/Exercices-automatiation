clear
$today = Get-Date 


do{
$user = Read-Host -Prompt "Entrez une date"

$date = $user -as [datetime]

}Until($date)

$dif = $today - $date

Write-Output "$($dif.Days) jours,$($dif.Hours) heures, $($dif.Minutes) minutes , $($dif.Seconds) secondes"
