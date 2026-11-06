FROM nginx:doesnotexist
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
