#Unlocks Gabe Harper
Unlock-ADAccount -Identity Gabe.Harper
Add-Content C:\Scripts\ScriptLogs\GabeLog.txt "Unlocked Gabe"
(Get-Date).tostring("dd-MM-yyyy-hh:mm:ss") | Out-File C:\Scripts\ScriptLogs\GabeLog.txt -append