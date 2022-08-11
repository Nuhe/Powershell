Function buscador{
$nombre = Read-Host "Ingrese el nombre del archivo a buscar "
$path = Read-Host "Ingrese la ruta a inspeccionar "
Get-ChildItem -Path $path -Recurse -Include *.* | Where-Object -FilterScript {($_.Name -match $nombre)}
}

Write-host "
  ########################################################################################################################
  ## Para saber a que mesa hay que enviar o derivar un ticket, consulta el archivo 'Incidentes Categoría y Derivaciones'##
  ## ubicado en la carpeta Guardia\Guardia COPO - PYC                                                                   ##
  ########################################################################################################################
"

do{
    buscador
}while($continue -match "yes")
$continue = read-host "¿Desea buscar otro archivo? Y/N"