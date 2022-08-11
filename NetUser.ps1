function Get-NetUser {
    $Usuario = read-host("Ingrese un usuario")
    net user $Usuario /do 
   }

do {
    Get-NetUser
    $Continue = read-host("¿Desea ingresar otro usuario? s/n")
} while ($Continue -eq "s")

