<#
.SYNOPSIS
    Creación de carpetas del proyecto. Única responsabilidad: directorios.
#>

# Crea una sola carpeta dentro de $RutaBase si no existe. Devuelve la ruta completa.
function New-Carpeta {
    param(
        [string]$RutaBase,
        [string]$NombreCarpeta
    )
    $dir = [System.IO.Path]::Combine($RutaBase, $NombreCarpeta)
    if (-not [System.IO.Directory]::Exists($dir)) {
        [System.IO.Directory]::CreateDirectory($dir) | Out-Null
    }
    return $dir
}

# Crea varias carpetas en paralelo dentro de $RutaBase.
function New-Carpetas {
    param(
        [string]$RutaBase,
        [string[]]$Carpetas
    )
    if (-not $Carpetas) { return }
    $Carpetas | ForEach-Object -Parallel {
        $dirCompleta = [System.IO.Path]::Combine($using:RutaBase, $_)
        if (-not [System.IO.Directory]::Exists($dirCompleta)) {
            [void][System.IO.Directory]::CreateDirectory($dirCompleta)
        }
    }
}

function create_dir {
    param(
        [string]$name_dir
    )
    $rut = $this.RUTA_ABSOLUTA
    $dir = [System.IO.Path]::Combine($rut, $name_dir)
    if (-not [System.IO.Directory]::Exists($dir)) {
        [System.IO.Directory]::CreateDirectory($dir) | Out-Null
    }
    return $dir
}
