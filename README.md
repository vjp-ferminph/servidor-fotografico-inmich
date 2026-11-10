# Servidor multimedia y fotográfico privado con Immich

## 1. Descripción

Proyecto de ASIR para desplegar un servidor multimedia y fotográfico privado utilizando Immich sobre Debian y Docker.

El objetivo es disponer de una plataforma propia para almacenar, gestionar y visualizar fotografías y vídeos desde diferentes dispositivos.

## 2. Tecnologías utilizadas

- Debian
- Docker
- Docker Compose
- Immich
- PostgreSQL
- Valkey
- Git y GitHub

## 3. Requisitos previos

Para instalar el proyecto se necesita:

- Un servidor Debian.
- Docker instalado y funcionando.
- Docker Compose disponible mediante `docker compose`.
- Git instalado.
- Conexión a Internet.
- Espacio suficiente para almacenar fotografías y vídeos.

## 4. Instalación e inicio del proyecto

### Paso 1. Clonar el repositorio

```bash
git clone URL_DEL_REPOSITORIO
```

### Paso 2. Entrar en el directorio

```bash
cd servidor-fotografico-inmich/immich
```

### Paso 3. Crear el archivo de configuración

Copiar el archivo de ejemplo:

```bash
cp .env.example .env
```

Editar la configuración:

```bash
nano .env
```

Modificar especialmente la contraseña de PostgreSQL y las rutas de almacenamiento.

### Paso 4. Iniciar los servicios

Desde el directorio `immich`, ejecutar:

```bash
docker compose up -d
```

Este comando descarga las imágenes necesarias y arranca los contenedores.

### Paso 5. Comprobar el funcionamiento

```bash
docker compose ps
```

### Paso 6. Acceder a Immich

Abrir un navegador y acceder a:

```text
http://IP_DEL_SERVIDOR:2283
```

La primera vez aparecerá la pantalla de bienvenida y registro del administrador.

## 5. Servicios desplegados

| Servicio | Función |
|---|---|
| Immich Server | Aplicación web y gestión multimedia |
| Machine Learning | Procesamiento inteligente de imágenes |
| PostgreSQL | Base de datos |
| Valkey | Gestión de tareas en segundo plano |

## 6. Gestión de los servicios

Iniciar:

```bash
docker compose up -d
```

Detener:

```bash
docker compose down
```

Ver los contenedores:

```bash
docker compose ps
```

Consultar los registros:

```bash
docker compose logs -f
```

## 7. Seguridad

- No publicar contraseñas en GitHub.
- No subir el archivo `.env`.
- No almacenar fotografías privadas en el repositorio.
- Restringir el acceso al servidor a la red autorizada.
- Realizar copias de seguridad periódicas.

## 8. Autores

- Fermín Pérez Herrero
- Oliver Sanchez Calza