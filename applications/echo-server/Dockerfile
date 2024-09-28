FROM itsnikko/docker-alpine-demo:latest

WORKDIR /app

RUN addgroup -g 1000 go \
    && adduser -G go -u 1000 go -h '/home/go' -D \
    && chown go:go -R /app

USER go

COPY --chown=go:go ./ ./

EXPOSE 3333

ENTRYPOINT ["go", "run", "main.go"]