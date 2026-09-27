. Join-Path $PSScriptRoot "writer-files.ps1"
. Join-Path $PSScriptRoot "writer-dirs.ps1"
. Join-Path $PSScriptRoot "reader-general.ps1"

class Generador_Proyects {
    # Propiedades principales
    [string]$NAME_FILE
    [string]$NAME_PROYECT
    [string]$RUTA_ABSOLUTA

    # CORREGIDO: Propiedades estáticas de rutas al estilo C#
    [string]$LICENSE_MIT
    [string]$LICENSE_GPLv3
    [string]$CODE_OF_CONDUCT

    # Constructor optimizado con .NET
    Generador_Proyects([string]$name_file, [string]$name_proyect) {
        $this.NAME_FILE = $name_file
        $this.NAME_PROYECT = $name_proyect

        # .NET combina la ruta del escritorio de forma limpia
        $desktop = [Environment]::GetFolderPath("Desktop")
        if ([string]::IsNullOrWhiteSpace($desktop)) {
            # Si no hay escritorio (ej. CI/CD o Linux), usar el directorio actual
            $desktop = Get-Location
        }
        $this.RUTA_ABSOLUTA = [System.IO.Path]::Combine($desktop, $name_proyect)

        # Inicialización de tus constantes de rutas (Apunta a tus carpetas de origen)
        # Usar Join-Path / Combine en lugar de concatenar cadenas con \
        $this.LICENSE_MIT = [System.IO.Path]::Combine($PSScriptRoot, "licenses", "examples", "MIT-LICENSE.txt")
        $this.LICENSE_GPLv3 = [System.IO.Path]::Combine($PSScriptRoot, "licenses", "examples", "GNU-GPLv3.txt")
        $this.CODE_OF_CONDUCT = [System.IO.Path]::Combine($PSScriptRoot, "config", "governance-config", "examples", "CODE_OF_CONDUCT.md")
    }

    [void] Crear_Proyect() {
        # Crear el directorio del proyecto si no existe
        if (-not (Test-Path -Path $this.RUTA_ABSOLUTA)) {
            New-Item -ItemType Directory -Path $this.RUTA_ABSOLUTA | Out-Null
        }

        # Llamar a los métodos para crear archivos y directorios
        $this.Crear_Archivos()
        $this.Crear_Directorios()
    }
}
