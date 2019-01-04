---
layout: post
title: Nginx and Organizr 
subtitle: proxying access to media server
date: 2018-04-12
header-img: img/headers/t-rex.jpg
comments: true
published: true
---

Following up on my earlier post about hosting my own [private media server]({{ site.url }}/2018/01/19/private-media-server) this will cover the details of proxying web access from Nginx through to backend services.  Interfaces are managed via Organizr.

![Organizr]({{ site.url }}/img/posts/private_media_server_organizr.png)

This uses the [cookie-based authorization](https://github.com/causefx/Organizr/wiki/Authentication-%7C-Cookie-Based) available from Organizr.

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
    location /auth-admin { rewrite ^ /auth.php?admin&ban=someone,thisperson; }
    location /auth-user { rewrite ^ /auth.php?user&ban=someone,thisperson; }  
    error_page 400 401 403 404 405 408 500 502 503 504  /error.php?error=$status;
    location / {try_files $uri $uri/ =404;}
    location ^~ /PimpMyLog/ {
      auth_request /auth-admin;
      include config/phpblock.conf; 
    }
    include config/phpblock.conf;  #PHP Block
  }

location /transmission {
    if ($cookie_cookiePassword != "TestPassword") { return 403; }
    add_header X-Frame-Options "SAMEORIGIN";
    proxy_pass http://127.0.0.1:9091;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  }

location /nzbget {
    if ($cookie_cookiePassword != "TestPassword") { return 403; }
    add_header X-Frame-Options "SAMEORIGIN";
    proxy_pass http://127.0.0.1:6789;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  }

location /sonarr {
    if ($cookie_cookiePassword != "TestPassword") { return 403; }
    add_header X-Frame-Options "SAMEORIGIN";
    proxy_pass http://127.0.0.1:8989;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  }

location /radarr {
    if ($cookie_cookiePassword != "TestPassword") { return 403; }
    add_header X-Frame-Options "SAMEORIGIN";
    proxy_pass http://127.0.0.1:7878;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  }

location /jackett {
    if ($cookie_cookiePassword != "TestPassword") { return 403; }
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
    if ($cookie_cookiePassword != "TestPassword") { return 403; }
    add_header X-Frame-Options "SAMEORIGIN";
    proxy_pass http://192.168.1.114:32400/;
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
    if ($cookie_cookiePassword != "TestPassword") { return 403; }
    add_header X-Frame-Options "SAMEORIGIN";
    proxy_pass http://192.168.1.114:8181;
    proxy_set_header Host $http_host;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Host $server_name;
    proxy_set_header X-Forwarded-Proto $scheme;
    proxy_set_header X-Real-IP $remote_addr;
  }

location /ombi/ {
    if ($cookie_cookiePassword != "TestPassword") { return 403; }
    add_header X-Frame-Options "SAMEORIGIN";
    proxy_pass http://127.0.0.1:5000;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection keep-alive;
    proxy_set_header Host $host;
    proxy_cache_bypass $http_upgrade;
  }
if ($http_referer ~* /ombi/) {
    rewrite ^/dist/([0-9\d*]).js /ombi/dist/$1.js;
    rewrite ^/loading.css /ombi/loading.css;    
  }
```

Naturally, I replaced `TestPassword` above with a strong password.

# Conclusion

Overall, I've found Nginx and Organizr to work very well together. I particularly like the delegation of authentication to Plex itself, which maps to friends and family I've shared access with.
 

### More in this series...
* [Private Media Server]({{ site.url }}/2018/01/19/private_media_server/) - overview of my server.
* [Nginx and Organizr v2]({{ site.url }}/2019/01/03/nginx_organizr_v2/) -  updated proxying for Organizr v2.
