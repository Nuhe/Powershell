function Crear{
    try{
        $name = Read-Host "Nombre de la carpeta"
        $file = Read-Host "¿Quiere crear un archivo en el destino?"
        $fileName = Read-Host "Nombre del archivo"
        mkdir -path c:\ -name $name -ErrorAction stop
        
        if ($file -match "si"){
            
            New-Item -path c:\$name -name $fileName
        }
    }
    catch{
        Write-Warning $Error[0]
    }
}

Write-Host "###Creador de carpetas y archivos###"

Crear

