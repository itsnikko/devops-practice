FROM itsnikko/docker-alpine-demo

WORKDIR /app

RUN addgroup -g 1000 python \
    && adduser -G python -u 1000 python -h '/home/python' -D \
    && chown python:python -R /app

USER python

ENV PYTHONUNBUFFERED="true" \
    PYTHONPATH="." \
    PATH="${PATH}:/home/python/.local/bin" \
    USER="python"

COPY --chown=python:python webserver /usr/local/bin

EXPOSE 8000

CMD ["webserver", "0.0.0.0:8000"]