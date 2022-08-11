function ResetPass{
$Credential = Get-Credential
$Name = read-host("Ingresar el usuario")
#$NewPwd = convertto-securestring (Read-Host("Ingrese la nueva contraseña")) -asplaintext -force 
$NewPwd = Read-Host("Ingrese la nueva contraseña") -AsSecureString
Set-ADAccountPassword -Identity $Name -NewPassword $NewPwd -Credential $Credential
write-host("Contraseña de " + $name + "fue actualizada")}

do{
    ResetPass
    $Continue = Read-Host("¿Desea reiniciar otra contraseña? s/n")
}while($continue -eq "s")