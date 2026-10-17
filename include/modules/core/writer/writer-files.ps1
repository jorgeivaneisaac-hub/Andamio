class WriterFiles {
    [string]$NAME_FILE
    [string]$NAME_PROYECT
    [string]$RUTA_ABSOLUTA

    WriterFiles([string]$name_file, [string]$name_proyect) {
        $this.NAME_FILE = $name_file
        $this.NAME_PROYECT = $name_proyect

        # .NET combina la ruta del escritorio de forma limpia
        $desktop = [Environment]::GetFolderPath("Desktop")
        if ([string]::IsNullOrWhiteSpace($desktop)) {
            # Si no hay escritorio (ej. CI/CD o Linux), usar el directorio actual
            $desktop = Get-Location
        }
        $this.RUTA_ABSOLUTA = [System.IO.Path]::Combine($desktop, $name_proyect)
    }
    [void]copy_files([string]$RutaOrigen, [string]$RutaDestino, [bool]$Overwrite) {
        if ([System.IO.File]::Exists($RutaOrigen)) {
            [System.IO.File]::Copy($RutaOrigen, $RutaDestino, $Overwrite)
        }
    }
    [void]write_file([string]$RutaRelativa, [string]$Contenido) {
        $rutaFinal = [System.IO.Path]::Combine($this.RUTA_ABSOLUTA, $RutaRelativa)
        $carpeta = [System.IO.Path]::GetDirectoryName($rutaFinal)
        if (-not [System.IO.Directory]::Exists($carpeta)) {
            [void][System.IO.Directory]::CreateDirectory($carpeta)
        }
        if (-not [System.IO.File]::Exists($rutaFinal)) {
            [System.IO.File]::WriteAllText($rutaFinal, $Contenido, [System.Text.UTF8Encoding]::new($false))
        }
    }
}
