FROM node:19-alpine3.16 as build

WORKDIR /src

COPY ./package*.json ./

RUN npm ci

COPY . ./

RUN npm run build

# nginx block

FROM nginx:1.23.4-alpine-slim

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*

# Static build
COPY --from=build /src/build .

# Start Nginx server
CMD [ "nginx","-g","daemon off;"]
