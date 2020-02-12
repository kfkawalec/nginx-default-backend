FROM nginx:1-alpine

RUN rm -rf /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY etc/nginx.conf /etc/nginx/
COPY etc/*.template /etc/nginx/conf.d/

CMD envsubst '${ERROR_DOMAIN}' < /etc/nginx/conf.d/default.template > /etc/nginx/conf.d/default.conf \
    && exec nginx -g 'daemon off;'

EXPOSE 80
