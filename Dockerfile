# Usamos una imagen limpia de Linux Alpine (Evita las URLs de Microsoft)
FROM alpine:3.20 AS runner

# Instalamos PowerShell 7 directamente desde los repositorios de Linux
RUN apk add --no-cache powershell

# Configuraciones de entorno básicas
ENV TERM=xterm-256color POWERSHELL_TELEMETRY_OPTOUT=1

WORKDIR /app

# Creamos el usuario seguro sin privilegios
RUN addgroup -g 1001 -S pwshgroup && adduser -u 1001 -S pwshuser -G pwshgroup

# Copiamos las carpetas de tu repositorio
COPY --chown=pwshuser:pwshgroup core/ ./core/
COPY --chown=pwshuser:pwshgroup Data/ ./Data/

USER pwshuser

# Arrancamos tu script principal al iniciar el contenedor
ENTRYPOINT ["pwsh", "-NoLogo", "-NoProfile", "-Command", "core/main.ps1"]
