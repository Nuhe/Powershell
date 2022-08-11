Function reiniciar{
    $name = Read-Host "¿Cual es el nombre o IP del equipo que quiere reiniciar?"
    Restart-Computer -force -ComputerName $name    
}


do{
    reiniciar
}while($continue -match "yes")

$continue = Read-Host "¿Desea reiniciar otra maquina? YES/NO"