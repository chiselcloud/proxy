# The Chisel Proxy

This is the simple proxy used by [chisel.cloud](https://chisel.cloud) to overcome CORS restrictions against certain APIs.

Hosted on [Heroku](https://chisel-cloud-proxy.herokuapp.com).


# To setup the proxy

- Modify `Access-Control-Allow-Origin` on proxy.conf.tpl to match your dev environment
- Run `docker build .`
- Run `docker run -e PORT=8077 -p 8077:8077 {container ID}`
