FROM nginx:latest
WORKDIR /var/www/html/index.html
COPY ./index /var/www/html/index.html

EXPOSE 8000
