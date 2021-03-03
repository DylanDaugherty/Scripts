$user = Get-ADUser -identity "eolson" -properties pwdlastset
#Before Changed
[datetime]::FromFileTime($user.pwdlastset)
$user.pwdlastset =0
set-aduser -Instance $user
$user.pwdlastset = -1
set-aduser -Instance $user
$user = Get-ADUser -identity "eolson" -properties pwdlastset
#After Changed
[datetime]::FromFileTime($user.pwdlastset)