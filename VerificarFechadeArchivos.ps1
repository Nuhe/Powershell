#Esta funcion solicita una ruta, una fecha limite y busca en todo el directorio aquellos archivos que no superen la fecha establecida.
#Tambien crea un archivo .txt con una lista de los archivos que son mas viejos que la fecha establecida.
Function Buscador{
$ruta = Read-Host 'Ingrese la ruta a inspeccionar '
$fecha = Read-Host 'Ingrese una fecha limite: (mm/dd/aaaa)'
Get-ChildItem -Path $ruta -Recurse -Include *.* | Where-Object -FilterScript {($_.LastWriteTime -lt $fecha)} | Out-File c:\temp\OutDateFiles.txt
}
$verificarRuta = test-path C:\temp

#Verifica si la carpeta Temp esta creada en el disco local C:
if($verificarRuta -eq "True"){
    Buscador
}else{
    Write-Output 'Primero tenes que crear la carpeta c:\temp'}