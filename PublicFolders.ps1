Connect-Exchange
$resultsarray = @()

$mailpub = Get-MailPublicFolder -ResultSize unlimited
foreach ($folder in $mailpub) {
  $email      = $folder.primarysmtpaddress.local + "@" + $folder.primarysmtpaddress.domain
  $pubfolder  = Get-PublicFolder -Identity $folder.identity
  $folderpath = $pubfolder.parentpath + "\" + $pubfolder.name
  $pubObject = new-object PSObject
  $pubObject | add-member -membertype NoteProperty -name "Email" -Value $email
  $pubObject | add-member -membertype NoteProperty -name "FolderPath" -Value $folderpath
  $pubObject | add-member -membertype NoteProperty -name "PublicFolderName" -Value $pubfolder.ContentMailboxName

  $resultsarray += $pubObject
}

$resultsarray | export-csv -Path C:\publicfolder.csv