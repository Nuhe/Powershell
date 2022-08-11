function Get-ADAccStatus{
    #$Credential = Get-Credential 
    $name = Read-Host("Ingrese el usuario")
    Get-ADUser -Identity $name -Properties LockedOut | Select-Object samaccountName,Lockedout| ft -AutoSize
    $Pregunta = read-Host("¿Quieres desbloquear el usuario? s/n")
        if ($Pregunta -eq "s"){
         Get-ADUser -Identity $name -Credential $Credential| Unlock-ADAccount
         Write-Host("El usuario esta desbloqueado")
         
}}
do{
    Get-ADAccStatus
    $Continue = read-host("¿Desea ingresar otro usuario? s/n")
    }while($Continue -eq "s")


         


