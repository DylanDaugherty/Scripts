Connect-Exchange
Import-Csv "BSPTEAM.csv"|ForEach-object {Add-DistributionGroupMember -BypassSecurityGroupManagerCheck -Identity "BSP Team" -Member $_.Email} 
echo $_.Email