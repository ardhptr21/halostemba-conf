server {
  listen 80;
  listen [::]:80;

  server_name monitor.halostemba.com;

  location / {
    proxy_pass http://localhost:9000;
    include proxy_params;
  }
}