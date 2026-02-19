param(
    [string]$path = "$PSScriptRoot\ip.csv"
)
test-path $path
#$path = "$PSScriptRoot\ip.csv"
$csvFile = Import-Csv -Path $path

foreach ($line in $csvFile) {
    $line.AdressIP
    $line.Statut = 'null'
    $connected = test-connection $line.AdressIP -count 1 -Quiet -ErrorAction SilentlyContinue
    if ($connected) {
        $line.Statut = 'connected'
        $line.NomServeur = [System.Net.Dns]::GetHostEntry($line.AdressIP).HostName
    }
    else {
        $line.Statut = 'Disconnected'
    }
   
   [System.net.Dns]::GetHostEntry('8.8.8.8').HostName
}

#$csvFile | Export-Csv -Path $path -NoTypeInformation

