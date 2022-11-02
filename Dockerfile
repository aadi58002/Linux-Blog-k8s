FROM docker.io/library/nginx:latest
WORKDIR /usr/share/nginx/html
COPY ./dist .
