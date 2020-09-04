FROM nginx:1-alpine

RUN rm -rf /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY nginx/nginx.conf /etc/nginx/
COPY nginx/*.template /etc/nginx/conf.d/
COPY html/* /etc/nginx/html/

CMD envsubst '${ERROR_DOMAIN}' < /etc/nginx/conf.d/default.template > /etc/nginx/conf.d/default.conf \
    && exec nginx -g 'daemon off;'

EXPOSE 80
