cls
Get-ChildItem "$env:USERPROFILE\Downloads" -Filter *.txt | Sort-Object LastWriteTime | Select-Object -First 1 | Remove-Item -WhatIf