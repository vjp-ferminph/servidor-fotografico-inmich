
#!/bin/bash

# Instalador automatico de Immich
# Proyecto: Servidor multimedia y fotografico privado

set -e

echo "======================================"
echo " Instalacion del servidor Immich"
echo "======================================"

# Comprobar Docker
if ! command -v docker &> /dev/null; then
    echo "ERROR: Docker no esta instalado."
    exit 1
fi

# Comprobar Docker Compose
if ! docker compose version &> /dev/null; then
    echo "ERROR: Docker Compose no esta disponible."
    exit 1
fi

# Localizar el directorio del proyecto
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
IMMICH_DIR="$PROJECT_DIR/inmich"

# Comprobar que existe docker-compose.yaml
if [ ! -f "$IMMICH_DIR/docker-compose.yaml" ]; then
    echo "ERROR: No se encuentra docker-compose.yaml."
    exit 1
fi

# Trabajar desde el directorio de Immich
cd "$IMMICH_DIR"

# Crear archivo de configuracion si no existe
if [ ! -f ".env" ]; then
    if [ ! -f ".env.example" ]; then
        echo "ERROR: No se encuentra .env.example."
        exit 1
    fi

    cp .env.example .env
    echo "Archivo .env creado."
    echo "IMPORTANTE: Edita .env y configura una contrasena segura."
    exit 1
fi

# Crear directorios de almacenamiento
mkdir -p data postgres

# Comprobar permisos de Docker
if ! docker info &> /dev/null; then
    echo "ERROR: No se puede acceder a Docker."
    echo "Comprueba los permisos o ejecuta el script con sudo."
    exit 1
fi

# Iniciar servicios
echo "Iniciando servicios de Immich..."
docker compose up -d

echo "======================================"
echo " Instalacion completada"
echo "======================================"
echo "Accede a Immich mediante:"
echo "http://IP_DEL_SERVIDOR:2283"
