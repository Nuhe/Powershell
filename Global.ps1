
function Get-Global {
$list = "Descubriste un secreto. ¡¡Felicidades!!", "C:\Users\ext_crodrigu\Downloads\ScriptsPowershell\ping-t.ps1", "C:\Users\ext_crodrigu\Downloads\ScriptsPowershell\NetUser.ps1", "\\pfsnas01\PESA\PESA_CSER_TICO_OTEL\Reservada\Atencion Al Cliente\soporte tecnico y 555\Soporte de Campo\Software\Calculadora\calculadora para W10\qalculate-3.11.0-i386.msi", "C:\Users\ext_crodrigu\Downloads\ScriptsPowershell\desbloquearusuario.ps1", "C:\Users\ext_crodrigu\Downloads\ScriptsPowershell\abrirad.ps1", "C:\Users\ext_crodrigu\Downloads\ScriptsPowershell\ResetPass.ps1" , "C:\Users\ext_crodrigu\Downloads\ScriptsPowershell\CmRcViewer.ps1"
$opcion = read-host("
1- Ping -t 
2- NetUser
3- Calculadora
4- Desbloquear Usuario (BETA)
5- Abrir AD (BETA)
6- Reiniciar Contraseña (BETA)
7- RemoteControl (BETA)

Elige el Script")

start $list[$opcion]
}

do {
    Get-Global
    $Continue = read-host("¿Desea utilizar otro Script? s/n")
} while ($Continue -eq "s")