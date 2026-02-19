function Modifier-service{
    param(
      $nom,
      [ValidateSet("fermer","redémarrer")]
      $etatVoulu

    )
    if ($etatVoulu -eq "fermer") {
        Stop-Service -Name $nom -force -WhatIf

    }else{
        Restart -Service -Name $nom -force -WhatIf
    }
    Write-Host 'Tache terminé'
}