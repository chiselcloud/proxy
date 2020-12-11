FROM nginx:latest

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY proxy.conf.tpl /etc/nginx/conf.d/proxy.conf.tpl

CMD sed -e 's/\$__PORT__\$/'"$PORT"'/g' -e 's@\$__APP_HOST__\$@'"$APP_HOST"'@' /etc/nginx/conf.d/proxy.conf.tpl > /etc/nginx/conf.d/default.conf && nginx
