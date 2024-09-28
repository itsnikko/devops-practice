FROM itsnikko/docker-alpine-demo:latest

WORKDIR /app

RUN addgroup -g 1000 go \
    && adduser -G go -u 1000 go -h '/home/go' -D \
    && chown go:go -R /app

USER go

COPY --chown=go:go main.go /usr/local/bin

EXPOSE 3333

CMD ["go run main.go"]