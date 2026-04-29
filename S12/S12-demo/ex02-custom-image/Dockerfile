FROM nginx:1.27-alpine

WORKDIR /usr/share/nginx/html
COPY site/index.html ./index.html

CMD ["nginx", "-g", "daemon off;"]