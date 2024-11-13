# Dockerfile para frontend (React)
FROM node:18

WORKDIR /app

COPY package.json /app/package.json

RUN npm install

COPY ./facecris_frontend /app/

CMD ["npm", "start"]
