# Usa la imagen oficial de n8n como base
FROM n8nio/n8n:latest

# Cambia a usuario root para poder instalar paquetes
USER root

# Instala unrar
RUN apt-get update && \
    apt-get install -y unrar && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Vuelve al usuario node (requerido por n8n)
USER node
