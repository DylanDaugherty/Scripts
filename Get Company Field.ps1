## Displays Company Field in AD for Every User IN the DG Contractors
foreach($aduser in (Get-DistributionGroupMember -Identity "FaithlifeDeMexico")){
    Get-ADuser -identity $aduser.samaccountname -Properties Company 
    }