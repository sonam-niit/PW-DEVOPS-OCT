FROM node:20-alpine3.20

WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install

COPY server.js .
EXPOSE 3000
ENV PORT=3000

CMD ["node","server.js"]