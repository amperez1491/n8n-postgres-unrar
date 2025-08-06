FROM n8n:latest

USER root

# Instalar dependencias del sistema y Python
RUN apk add --no-cache \
    python3 \
    py3-pip \
    && rm -rf /var/cache/apk/*

# Instalar dependencias de Python
RUN pip3 install pandas openpyxl

# Instalar dependencias de Node.js
RUN npm install xlsx node-xlsx \
    && npm cache clean --force

# Volver al usuario por defecto
USER node
