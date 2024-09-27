FROM itsnikko/docker-alpine-demo

WORKDIR /app

RUN addgroup -g 1000 go \
    && adduser -G go -u 1000 python -h '/home/go' -D \
    && chown go:go -R /app

USER go

ENV PATH="${PATH}:/home/go/.local/bin" \
    USER="go"

COPY --chown=go:go webserver /usr/local/bin

EXPOSE 8000

CMD ["go run main.go"]