$Username = "name"
$Password = "pass"

$Group = "Administrators"

$ADSI = [ADSI]"WinNT://$Env:COMPUTERNAME"
$Existing = $ADSI.Children | where {$_.SchemaClassName -eq 'user' -and $_.Name -eq $Username }

if ($Existing -eq $Null) {

    Write-Host "Creating new local user $Username."
    & NET USER $Username $Password /add /y /expires:never
    
    Write-Host "Adding local user $Username to $Group."
    & NET LOCALGROUP $Group $Username /add

}
else {
    Write-Host "Setting password for existing local user $Username."
    $Existing.SetPassword($Password)
}

Write-Host "Ensuring password for $Username never expires."
& WMIC USERACCOUNT WHERE "Name='$Username'" SET PasswordExpires=FALSE
