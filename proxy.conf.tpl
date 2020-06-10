server {
    resolver 88.80.70.7;
    listen $__PORT__$ default_server;

    location / {
        add_header 'Access-Control-Allow-Credentials' 'true';
        add_header 'Access-Control-Allow-Headers' 'Authorization,Accept,Origin,DNT,X-Chisel-Proxied-Url,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Content-Range,Range';
        add_header 'Access-Control-Allow-Methods' 'GET,POST,OPTIONS,PUT,DELETE,PATCH';

        if ($request_method = 'OPTIONS') {
          add_header 'Access-Control-Allow-Origin' 'https://chisel.cloud';
          add_header 'Access-Control-Allow-Credentials' 'true';
          add_header 'Access-Control-Allow-Headers' 'Authorization,Accept,Origin,DNT,X-Chisel-Proxied-Url,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Content-Range,Range';
          add_header 'Access-Control-Allow-Methods' 'GET,POST,OPTIONS,PUT,DELETE,PATCH';
          add_header 'Access-Control-Max-Age' 1728000;
          add_header 'Content-Type' 'text/plain charset=UTF-8';
          add_header 'Content-Length' 0;
          return 204;
        }

        proxy_redirect off;
        proxy_set_header Host $proxy_host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_pass $http_x_chisel_proxied_url;
        proxy_hide_header 'access-control-allow-origin';
        add_header 'access-control-allow-origin' 'https://chisel.cloud';
    }
}
