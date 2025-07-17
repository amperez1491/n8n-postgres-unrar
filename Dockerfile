FROM node:18-bullseye

# Cambiar a usuario root para instalar dependencias
USER root

# Instalar unrar-free y limpiar caché
RUN apt-get update && \
    apt-get install -y unrar-free && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Crear usuario n8n y carpeta de trabajo
RUN useradd -m -s /bin/bash node
WORKDIR /home/node/app

# Instalar n8n globalmente
RUN npm install -g n8n

# Volver al usuario node
USER node

# Exponer el puerto por defecto de n8n
EXPOSE 5678

# Comando para iniciar n8n
CMD ["n8n"]
