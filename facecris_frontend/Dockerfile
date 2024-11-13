# Dockerfile para frontend (React)
FROM node:18

WORKDIR /app

COPY package.json /app/package.json

RUN npm install

COPY . /app/facecris_frontend

CMD ["npm", "start"]
