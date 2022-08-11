function pingeo{
    $ping = Read-Host "
    Ingrese una ip "
    ping $ping
}

function Get-NetUser {
   do {
    $Usuario = read-host("
    Ingrese un usuario")
    net user $Usuario /do     
    $Continue = read-host("
    ¿Desea ingresar otro usuario? (S)i o (N)o")
} while ($Continue -eq "s")}

function DesbloquearUsuario($Credes){
     do{ 
        $name = Read-Host("
        Ingrese el usuario")
        Get-ADUser -Identity $name -Properties LockedOut | Select-Object samaccountName,Lockedout| ft -AutoSize
        $Pregunta = read-Host("
        ¿Quieres desbloquear el usuario? (S)i o (N)o")
            if ($Pregunta -eq "s"){
                Get-ADUser -Identity $name -Credential $Credes | Unlock-ADAccount
                Write-Host("
                El usuario esta desbloqueado")}
                $Continue = read-host("
                  ¿Desea ingresar otro usuario? (S)i o (N)o")
         
}while($Continue -eq "s")
}

function ReiniciarContraseña($Credes){
    do{
        $Name = read-host("
        Ingresar el usuario")
        #$NewPwd = convertto-securestring (Read-Host("Ingrese la nueva contraseña")) -asplaintext -force 
        $NewPwd = Read-Host("Ingrese la nueva contraseña") -AsSecureString
        Set-ADAccountPassword -Identity $Name -NewPassword $NewPwd -Credential $Credes
        Set-ADUser -Identity $Name -ChangePasswordAtLogon $true -Credential $Credes
        write-host("
        Contraseña de " + $name + " fue actualizada. El usuario tendra que cambiar su contraseña en su proxima conexion.")

        $Continue = Read-Host("
        ¿Desea reiniciar otra contraseña? (S)i o (N)o")
}while($continue -eq "s")}

function AbrirRemote($Credes){
    Start-process "\\pfsnas01\shared\Instructivos Soporte Tecnico\NOVATIUM\Software\SCCM Remote Control\SCCM Remote Control\CmRcViewer.exe" -Credential $Credes
    }

function AbrirAD{
    Start-Process C:\Windows\system32\dsa.msc -Verb RunAsUser
}

do {
    $opcion = Read-Host "
---------------------------
0- Cargar Credenciales
---------------------------

------------CMD------------
1- Ping
2- NetUser
---------------------------

------ActiveDirectory------
3- Consultar/Desbloquear Usuario
4- Reiniciar Contraseña
---------------------------

------------BETA-----------
5- Abrir RemoteControl
6- Abrir AD
---------------------------
    
Elige un Script"

    switch($opcion){
        0{
            $GetCred = Get-Credential
            Break
        }
        1 {
            pingeo
            Break
        }
        2 {
            Get-NetUser
            Break
        }
        3 {
            DesbloquearUsuario($GetCred)
            Break
        }
        4 {
            ReiniciarContraseña($GetCred)
            Break
        }
        5 {
            AbrirRemote($GetCred)
            Break
        }
        6 {
            AbrirAD
            Break
        }
}


    $limpiar = read-host "
    ¿Desea limpiar la pantalla? (S)i o (N)o"
    if ($limpiar -eq "s"){
        cls
    } 
    $continue = read-host "
    Desea usar un script? (S)i o (N)o"
        
    
}while($continue -eq "s")

