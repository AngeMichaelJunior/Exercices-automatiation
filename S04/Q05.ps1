cls

function CalculerEspace{

$disque = Get-PSDrive -Name C
$total = $disque.Free + $disque.Used
$pourcentage = ($disque.used * 100) / $total
$pourcentage = [Math]::Round($pourcentage)  #arrondi
if($pourcentage -gt 50){
write-host "Attention l'espace utilisé est plus de 50% ($pourcentage%) sur le disque C " -ForegroundColor Red
}else{
write-host "Vous utilisez moins de 50% ($pourcentage%) de l’espace sur le disque C " -ForegroundColor Green
}
}

CalculerEspace