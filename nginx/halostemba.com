server {
  listen 80;
  listen [::]:80;

  server_name halostemba.com;

  location / {
    proxy_pass http://localhost:3000;
    include proxy_params;
  }
}

server {
  listen 80;
  listen [::]:80;

  server_name api.halostemba.com;

  location / {
    proxy_pass http://localhost:3100;
    include proxy_params;
  }
}

server {
  listen 80;
  listen [::]:80;

  server_name cdn.halostemba.com;

  location / {
    proxy_pass http://localhost:3200;
    include proxy_params;
  }
}

server {
  listen 80;
  listen [::]:80;

  server_name monitor.halostemba.com;

  location / {
    proxy_pass http://localhost:9000;
    include proxy_params;
  }
}