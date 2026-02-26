
#$job1 = Start-Job -ScriptBlock{
   # Get-ComputerInfo
   # }
#$job2 = Start-Job -ScriptBlock{
  #  Get-WinEvent -MaxEvents 100
  #  }
#Write-Output "en attente..."
#Wait-Job -Id $job1.Id
#Wait-Job -Id $job2.Id
#Write-Output "tache terminée"


#Receive-Job -Id $job1.Id
#Receive-Job -Id $job2.Id


#start
$job1 = Start-Job -ScriptBlock{
    Get-ComputerInfo
}
$job2 = Start-Job -ScriptBlock{
    Get-WinEvent -MaxEvents 100 -LogName System -MaxEvents 100
}
#Get-Job

#wait
#wait-job -id $job1.Id $job2.Id
Wait-Job -Id $job1.Id | Out-Null
Wait-Job -Id $job2.Id | Out-Null

#receive
$info = Receive-Job -Id $job1.Id
$log = Receive-Job -Id $job2.Id
Write-Output "os installé: $($info.osname) "
Write-Output "dernières entrées du journal système: $($log[0].Message) "