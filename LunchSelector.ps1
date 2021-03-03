##This is a simple powershell program to select potential lunch options from a list of lunch vendors

$vendor = Get-Content C:\Scripts\VendorNames.txt

$hash = @{}

foreach ($u in $vendor)

 {

  $hash.add($u,(Get-Random -Maximum $vendor.count))

 } #end foreach

 

$hash.GetEnumerator() | Sort-Object -Property value |

Select-Object -First 2
