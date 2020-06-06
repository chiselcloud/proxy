FROM nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY proxy.conf.tpl /etc/nginx/conf.d/proxy.conf.tpl

#CMD ["nginx", "-g", "daemon off;"]
CMD sed 's/\$__PORT__\$/'"$PORT"'/g' /etc/nginx/conf.d/proxy.conf.tpl > /etc/nginx/conf.d/proxy.conf && \
  nginx -g "daemon off;"
