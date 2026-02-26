Get-Command -Noun Job

$job = Start-Job -ScriptBlock{
   Get-ComputerInfo
}
Write-Output "en attente..."
Wait-Job -Id $job.Id
Write-Output "tache terminé"

Get-Job

$job = start-job -ScriptBlock{
   Get-ComputerInfo
}
Write-Output "en attente..."

$job | Wait-Job