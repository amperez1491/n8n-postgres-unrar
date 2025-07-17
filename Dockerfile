FROM n8nio/n8n:latest

USER root

# Usa apk (Alpine Package Manager) en vez de apt-get
RUN apk update && apk add unrar

USER node
