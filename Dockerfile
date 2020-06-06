FROM nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY proxy.conf.tpl /etc/nginx/conf.d/proxy.conf.tpl
RUN rm /etc/nginx/conf.d/default.conf

CMD sed 's/\$__PORT__\$/'"$PORT"'/g' /etc/nginx/conf.d/proxy.conf.tpl > /etc/nginx/conf.d/proxy.conf && \
  nginx -g "daemon off;"
