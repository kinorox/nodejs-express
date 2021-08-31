# Setup and build the client

FROM node:13-alpine as client
WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

COPY client/package.json /app/package.json

RUN npm install

RUN npm install react-scripts@3.3.1 -g

CMD ["npm", "start"]

# Setup the server

FROM node:14

WORKDIR /usr/src/app
COPY api/package*.json ./

RUN npm install

COPY api/. .

EXPOSE 9000

CMD [ "node", "app.js" ]