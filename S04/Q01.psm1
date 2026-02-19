cls
function is-big {
    param([System.IO.FileInfo]$fichier)

    return $fichier.lenght -gt 10MB
}

function search-bigFile{
    param(
    [string]$path
    )
    $fichiers = Get-childItem -path $path -File

    foreach($fichier in $fichiers){
        if(is-big $fichier){
            Write-Output "Le fichier $($fichier.FullName) est un gros fichier"
        }
    }
}

export-modulemember search-bigFile