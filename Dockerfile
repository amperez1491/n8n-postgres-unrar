FROM node:18-bullseye

# Instalar dependencias
RUN apt-get update && \
    apt-get install -y unrar-free && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Crear el directorio home del usuario node (si no existe) y corregir permisos
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node

# Cambiar al directorio de trabajo
WORKDIR /home/node/app

# Instalar n8n globalmente
RUN npm install -g n8n

# Cambiar al usuario node
USER node

EXPOSE 5678

# Comando por defecto
CMD ["n8n"]
