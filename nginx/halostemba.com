server {
  listen 80;
  listen [::]:80;

  server_name monitor.halostemba.com;

  location / {
    proxy_pass http://localhost:9000;
    include proxy_params;
  }
}

server {
  listen 80;
  listen [::]:80;

  server_name siem.halostemba.com;

  location / {
    proxy_pass https://localhost:8089;
    include proxy_params;
  }
}