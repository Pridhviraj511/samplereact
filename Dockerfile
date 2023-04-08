FROM node:19-alpine3.16 as build

WORKDIR /src

EXPOSE 3000

COPY ./samplereact/package.json /src

RUN npm install

COPY ./samplereact ./

RUN npm run build

# nginx block

FROM nginx:1.23.4-alpine-slim

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*

# Static build
COPY --from=build /src/build .

# Start Nginx server
CMD [ "nginx","-g","daemon off;"]
