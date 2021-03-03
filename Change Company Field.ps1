## Changes Company Field in AD for Every User IN the DG Contractors
foreach($aduser in (Get-DistributionGroupMember -Identity "FaithlifeDeMexico")){
    Set-ADuser -identity $aduser.samaccountname -company "Faithlife de Mexcio" -Verbose 
    }