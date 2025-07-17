# n8n + PostgreSQL + unrar

Este repositorio contiene una configuración personalizada de [n8n](https://n8n.io/) utilizando Docker Compose, PostgreSQL como base de datos y `unrar` instalado dentro del contenedor, lo que permite descomprimir archivos `.rar` directamente desde los workflows.

---

## 🚀 ¿Qué incluye este proyecto?

- Imagen personalizada de `n8n` con `unrar` instalado.
- Base de datos `PostgreSQL` integrada.
- Autenticación básica habilitada por defecto.
- Persistencia de datos vía volúmenes Docker.

---

## 📂 Estructura del proyecto

```
.
├── Dockerfile            # Construye n8n con unrar instalado
├── docker-compose.yml    # Orquesta n8n + PostgreSQL
```

---

## 🧰 Requisitos

- Docker
- Docker Compose
- Coolify (opcional, para despliegue PaaS)

---

## ⚙️ Configuración

### Variables importantes

Estas variables están configuradas por defecto en el `docker-compose.yml`, pero puedes personalizarlas:

```env
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=secret
DB_POSTGRESDB_USER=n8n
DB_POSTGRESDB_PASSWORD=n8n
DB_POSTGRESDB_DATABASE=n8n
```

---

## 🐳 Cómo usar

### Localmente

1. Clona el repositorio:

   ```bash
   git clone https://github.com/amperez1491/n8n-postgres-unrar.git
   cd n8n-postgres-unrar
   ```

2. Levanta los servicios:

   ```bash
   docker-compose up --build
   ```

3. Accede a n8n en: [http://localhost:5678](http://localhost:5678)

---

## 🛠️ Despliegue en Coolify

1. Conecta tu repositorio en Coolify como aplicación tipo **Docker Compose**.
2. Asegúrate de que los archivos `Dockerfile` y `docker-compose.yml` están en la raíz del repo.
3. Deja el campo de ruta del `docker-compose` vacío (si está en la raíz).
4. Establece el puerto de la app como `5678`.
5. Despliega 🚀

---

## 🗃 Volúmenes

- `n8n_data`: guarda datos persistentes de n8n.
- `postgres_data`: guarda la base de datos PostgreSQL.

---

## 🧪 Testeo de unrar en workflows

Puedes usar un nodo de ejecución con un comando personalizado como:

```bash
unrar x archivo.rar
```

Esto te permitirá extraer contenido `.rar` directamente desde n8n.

---

## 🧑‍💻 Autor

- Alejandro Mtnez | [@amperez1491](https://github.com/amperez1491)

---

## 📄 Licencia

MIT
