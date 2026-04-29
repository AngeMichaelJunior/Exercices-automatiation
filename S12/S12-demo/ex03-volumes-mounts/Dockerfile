FROM alpine:latest

RUN apk add --no-cache bash

WORKDIR /app

COPY scripts/collector.sh /app/collector.sh
RUN chmod +x /app/collector.sh

CMD ["/app/collector.sh"]
