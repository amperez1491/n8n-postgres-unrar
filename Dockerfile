FROM n8nio/n8n:latest

USER root


RUN npm install xlsx
RUN npm install node-xlsx
RUN npm cache clean --force

RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip3 install pandas openpyxl
RUN apt-get install -y libmagic-dev
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
# Volver al usuario por defecto
USER node


