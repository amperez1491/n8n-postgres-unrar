FROM node:20-bullseye

# Instalar dependencias del sistema
RUN apt-get update && \
    apt-get install -y unrar-free && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Crear directorio de configuración y ajustar permisos
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node

# Directorio de trabajo
WORKDIR /home/node/app

# Instalar n8n globalmente
RUN npm install -g n8n

# Cambiar al usuario no privilegiado
USER node

EXPOSE 5678

CMD ["n8n"]
