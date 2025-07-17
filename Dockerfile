FROM node:18-bullseye

# Instalar dependencias del sistema
RUN apt-get update && \
    apt-get install -y unrar && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Crear usuario n8n
RUN useradd -m -s /bin/bash node

# Crear carpeta de trabajo
WORKDIR /home/node/app

# Instalar n8n globalmente
RUN npm install -g n8n

# Cambiar a usuario node
USER node

# Puerto por defecto
EXPOSE 5678

# Comando para lanzar n8n
CMD ["n8n"]
