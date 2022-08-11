$Name = Read-Host("Nombre del usuario")
get-aduser -filter * -Properties Name, PasswordLastSet, "msDS-UserPasswordExpiryTimeComputed", LockedOut | where {$_.GivenName -eq $name -or $_.Surname -eq $Name} | select-object Name, PasswordLastSet, @{Name="ExpiryDate";Expression={[datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")}}, LockedOut
pause