## Displays Company Field in AD for Every User IN the DG Contractors
foreach($aduser in (Get-DistributionGroupMember -Identity "FaithlifeDeMexico")){
    Write-Host $aduser.samaccountname
    get-adprincipalgroupmembership -identity $aduser.samaccountname | Format-Table
    }