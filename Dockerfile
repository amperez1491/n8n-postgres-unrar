FROM node:18-bullseye

USER root

RUN apt-get update && \
    apt-get install -y unrar-free && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /home/node/app

RUN npm install -g n8n

USER node

EXPOSE 5678

CMD ["n8n"]
