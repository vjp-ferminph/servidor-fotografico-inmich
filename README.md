# Servidor multimedia y fotográfico privado con Immich

## 1. Descripción del proyecto

Proyecto para desplegar un servidor multimedia y fotográfico privado utilizando **Immich**, **Debian** y **Docker Compose**.

El objetivo es disponer de una plataforma propia para almacenar, gestionar y visualizar fotografías y vídeos desde diferentes dispositivos, manteniendo el control sobre los datos personales.

## 2. Tecnologías utilizadas

- Debian
- Docker
- Docker Compose
- Immich
- PostgreSQL
- Valkey

## 3. Estructura del repositorio

```text
servidor-fotografico-inmich/
├── README.md
├── .gitignore
├── scripts/
│   └── install.sh
└── inmich/
    ├── docker-compose.yaml
    ├── .env.example
    ├── .env
    ├── data/
    └── postgres/
```

**Nota:** Las carpetas `data/` y `postgres/` almacenan los datos locales de Immich y no se suben a GitHub. Se crean durante la instalación. El archivo `.env` contiene información privada y tampoco se sube al repositorio.

## 4. Requisitos previos

Para desplegar el proyecto se necesita:

- Un servidor con Debian.
- Docker instalado y funcionando.
- Docker Compose disponible mediante el comando `docker compose`.
- Git instalado.
- Conexión a Internet.
- Espacio suficiente para almacenar fotografías y vídeos.

## 5. Instalación y despliegue

El proyecto incluye un script de instalación automática que comprueba los requisitos, prepara los directorios necesarios y arranca los servicios de Immich.

### Paso 1. Clonar el repositorio

```bash
git clone https://github.com/vjp-ferminph/servidor-fotografico-inmich.git
```

### Paso 2. Entrar en el directorio del proyecto

```bash
cd servidor-fotografico-inmich
```

### Paso 3. Crear el archivo de configuración

Copiar el archivo de ejemplo:

```bash
cp inmich/.env.example inmich/.env
```

Editar la configuración:

```bash
nano inmich/.env
```

Cambiar especialmente `DB_PASSWORD` por una contraseña segura propia.

**Importante:** El archivo `.env` contiene información privada y no debe subirse a GitHub.

### Paso 4. Dar permisos al instalador

```bash
chmod +x scripts/install.sh
```

### Paso 5. Ejecutar la instalación automática

Desde la raíz del repositorio:

```bash
./scripts/install.sh
```

El script realizará las siguientes operaciones:

- Comprobar que Docker está instalado.
- Comprobar que Docker Compose está disponible.
- Localizar el archivo `docker-compose.yaml`.
- Comprobar que existe el archivo `.env`.
- Crear los directorios `data/` y `postgres/`.
- Comprobar el acceso al servicio Docker.
- Iniciar los contenedores mediante Docker Compose.

### Paso 6. Acceder a Immich

Abrir un navegador y acceder a:

```text
http://IP_DEL_SERVIDOR:2283
```

Si se accede desde el propio servidor, también se puede utilizar:

```text
http://localhost:2283
```

En el primer acceso aparecerá la pantalla de bienvenida para crear la cuenta de administrador.

## 6. Servicios desplegados

| Servicio | Función |
|---|---|
| Immich Server | Aplicación web y gestión multimedia |
| Machine Learning | Procesamiento inteligente de imágenes |
| PostgreSQL | Base de datos |
| Valkey | Gestión de tareas en segundo plano |

## 7. Gestión de los servicios

Los siguientes comandos deben ejecutarse desde el directorio `inmich`.

**Iniciar los servicios:**

```bash
docker compose up -d
```

**Detener los servicios:**

```bash
docker compose down
```

**Consultar el estado:**

```bash
docker compose ps
```

**Consultar los registros:**

```bash
docker compose logs -f
```

**Reiniciar los servicios:**

```bash
docker compose restart
```

La orden `docker compose down` detiene y elimina los contenedores, pero conserva los datos persistentes. No utilizar `docker compose down -v` salvo que se quiera eliminar también los volúmenes.

## 8. Seguridad y protección de datos

- No publicar contraseñas ni credenciales en GitHub.
- No subir el archivo `.env`.
- No almacenar fotografías ni vídeos personales en el repositorio.
- Mantener las carpetas de datos fuera del control de versiones.
- Restringir el acceso al servidor a la red autorizada.
- Realizar copias de seguridad periódicas de los archivos multimedia y de la base de datos.
- No exponer directamente el servicio a Internet sin implementar las medidas de seguridad adecuadas.

## 9. Autores

- Fermín Pérez Herrero
- Oliver Sanchez Calza

## 10. Repositorio

Proyecto disponible en GitHub:

https://github.com/vjp-ferminph/servidor-fotografico-inmich
