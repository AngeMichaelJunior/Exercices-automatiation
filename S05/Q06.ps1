$code = {
    $path = 'C:\users\2432816\Desktop\logs\*'

   $files = Get-ChildItem -Path $path -File -Filter '*.txt' -Exclude 'log.txt'

   foreach($file in $files){
      $text = Get-Content -Path $file.FullName
   }
}

$trigger = New-ScheduledTaskPrincipal -At Get-Date -RepetitionInterval (New-TimeSpan -Minutes 1) 


$action = New-ScheduledTask -execute "powershell.exe" -Argument $code

Register-ScheduledTask -Action $action -Trigger $trigger