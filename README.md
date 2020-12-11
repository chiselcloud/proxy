# The Chisel Proxy

This is the simple proxy used by [chisel.cloud](https://chisel.cloud) to overcome CORS restrictions against certain APIs.

Hosted on [Heroku](https://chisel-cloud-proxy.herokuapp.com).


# To setup the proxy

- Run `docker build .`
- Run `docker run -e PORT=8077 -e APP_HOST=http://app.chisel.local:3000 -p 8077:8077`
