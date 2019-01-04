---
layout: post
title: Nginx and Organizr v2
subtitle: proxying access to media server
date: 2019-01-03
header-img: img/headers/canmore_from_benchlands.jpg
comments: true
published: true
---

Following up on my earlier post about hosting my own [private media server]({{ site.url }}/2018/01/19/private-media-server) this will cover the details of proxying web access from Nginx through to backend services.  Interfaces are managed via Organizr v2. 
 
I strongly recommend using v2 of Organizr, but I have an [older post](({{ site.url }}/2018/04/12/nginx-organizr)) covering this with version 1 however.

![Organizr]({{ site.url }}/img/posts/private_media_server_organizr_v2.png)

This uses the Plex single sign-on (SSO) available from Organizr for authentication of all users.  All my backend services (Ombi, Tautulli, Sonarr, Radarr, Jackett, NzbHydra, Nzbget, Transmission, etc) are proxied by Nginx.

# Nginx organizr.conf

```
send_timeout 5m;
proxy_read_timeout 240;
proxy_send_timeout 240;
proxy_connect_timeout 240;
client_header_timeout 240;
client_body_timeout 240;

location / {
    root /opt/organizr/html;
    index index.php index.html index.htm index.nginx-debian.html;
    location ~ /auth-(.*) {
	    internal;
	    rewrite ^/auth-(.*) /api/?v1/auth&group=$1;
    }
    error_page 400 401 402 403 404 405 408 500 502 503 504 $scheme://$server_name/?error=$status;
    location / {try_files $uri $uri/ =404;}
    include config/phpblock.conf;  #PHP Block
  }

location /transmission {
    auth_request /auth-0;
    add_header X-Frame-Options "SAMEORIGIN";
    proxy_pass http://127.0.0.1:9091;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  }

location /nzbget {
    auth_request /auth-0;
    add_header X-Frame-Options "SAMEORIGIN";
    proxy_pass http://127.0.0.1:6789;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  }

location /nzbhydra/ {
    auth_request /auth-0;
    add_header X-Frame-Options "SAMEORIGIN";
    proxy_pass http://127.0.0.1:5075/nzbhydra/;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  }

location /sonarr {
    auth_request /auth-0;    
    add_header X-Frame-Options "SAMEORIGIN";
    proxy_pass http://127.0.0.1:8989;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  }

location /radarr {
    auth_request /auth-0;
    add_header X-Frame-Options "SAMEORIGIN";
    proxy_pass http://127.0.0.1:7878;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  }

location /jackett {
    auth_request /auth-0;
    add_header X-Frame-Options "SAMEORIGIN";
    proxy_pass http://127.0.0.1:9117;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
    proxy_set_header X-Forwarded-Host $http_host;
    proxy_redirect off;
  }

location /plex/ {
    auth_request /auth-4;
    add_header X-Frame-Options "SAMEORIGIN";
    proxy_pass http://192.168.1.149:32400/;
    client_max_body_size 10m;
    client_body_buffer_size 128k;
    proxy_bind $server_addr;
    proxy_buffers 32 4k;
    #Timeout if the real server is dead
    proxy_next_upstream error timeout invalid_header http_500 http_502 http_503;
    # Advanced Proxy Config
    send_timeout 5m;
    proxy_read_timeout 240;
    proxy_send_timeout 240;
    proxy_connect_timeout 240;
    proxy_hide_header X-Frame-Options;
    # Basic Proxy Config
    proxy_set_header Host $host:$server_port;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto https;
    proxy_redirect  http://  $scheme://;
    proxy_http_version 1.1;
    proxy_set_header Connection "";
    proxy_no_cache $cookie_session;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";  
  }
if ($http_referer ~* /plex/) {
    rewrite ^/web/(.*) /plex/web/$1? redirect;
  }

location /plexpy {
    auth_request /auth-4;
    add_header X-Frame-Options "SAMEORIGIN";
    proxy_pass http://127.0.0.1:8181;
    proxy_set_header Host $http_host;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Host $server_name;
    proxy_set_header X-Forwarded-Proto $scheme;
    proxy_set_header X-Real-IP $remote_addr;
  }

location /ombi/ {
    auth_request /auth-4;
    add_header X-Frame-Options "SAMEORIGIN";
    proxy_pass http://127.0.0.1:5000/ombi/;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection keep-alive;
    proxy_set_header Host $host;
    proxy_cache_bypass $http_upgrade;
  }
```

This resides in `/etc/nginx/config/` along with `phpblock.conf`:
```
fastcgi_read_timeout 240;

location ~ \.php$ {
   include snippets/fastcgi-php.conf;
   fastcgi_pass unix:/run/php/php7.0-fpm.sock;
}
```

and is imported by `/etc/nginx/sites-available/default`:

```
server {
  listen 80;
  server_name LOCAL_MACHINE_NAME;
  include config/organizr.conf;
}

server {
  listen 443 ssl;
  server_name REMOTE_MACHINE_NAME;
  include config/organizr.conf;
  ssl_certificate /etc/letsencrypt/live/REMOTE_MACHINE_NAME/fullchain.pem; # managed by Certbot
  ssl_certificate_key /etc/letsencrypt/live/REMOTE_MACHINE_NAME/privkey.pem; # managed by Certbot
}
```
Replace both `LOCAL_MACHINE_NAME` with your local machine name and `REMOTE_MACHINE_NAME` with machine.domain.com for example, after setting up SSL with Let's Encrypt.


# Conclusion

Overall, I've found Nginx and Organizr to work very well together. I particularly like the delegation of authentication to Plex itself for single sign-on, which maps to friends and family I've shared access with.
 

### More in this series...
* [Private Media Server]({{ site.url }}/2018/01/19/private-media-server/) - overview of my server.
* [Nginx and Organizr v1]({{ site.url }}/2018/04/12/nginx_organizr/) - proxying Organizr v1.
