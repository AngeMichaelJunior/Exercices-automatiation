FROM alpine:latest AS builder

WORKDIR /tmp
RUN echo "Contenu généré en stage 1 : Hello from Multi-Stage Build!" > hello.txt
RUN cat hello.txt

FROM nginx:1.27-alpine

WORKDIR /usr/share/nginx/html
COPY --from=builder /tmp/hello.txt ./hello.txt
RUN echo "<h1>Multi-Stage Build Result</h1><pre>$(cat hello.txt)</pre>" > index.html

CMD ["nginx", "-g", "daemon off;"]
