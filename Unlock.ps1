#Unlocks Whatever user is entered
Unlock-ADAccount
Search-ADAccount -LockedOut -UsersOnly -ResultPageSize 2000 -resultSetSize $null | Select-Object Name, SamAccountName, DistinguishedName