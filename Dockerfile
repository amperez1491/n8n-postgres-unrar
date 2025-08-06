FROM n8nio/n8n:latest

USER root

# Instalar paquetes de Node.js
RUN npm install xlsx node-xlsx && \
    npm cache clean --force

# Actualizar índice de paquetes y instalar Python, pip y dependencias
RUN apk update && \
    apk add --no-cache \
        python3 \
        py3-pip \
        libmagic-dev && \
    pip3 install --no-cache-dir pandas openpyxl

# Limpiar caché de apk (opcional, ya que --no-cache ayuda)
# Nota: no es necesario borrar listas porque --no-cache ya lo evita

# Volver al usuario seguro por defecto
USER node
