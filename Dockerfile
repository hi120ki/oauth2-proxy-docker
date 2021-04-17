FROM alpine:3.13

ARG VERSION=v7.1.2
ARG FILENAME=oauth2-proxy-${VERSION}.linux-amd64

RUN addgroup appgroup && adduser --disabled-password --no-create-home appuser -G appgroup

WORKDIR /app

RUN wget -q https://github.com/oauth2-proxy/oauth2-proxy/releases/download/${VERSION}/${FILENAME}.tar.gz \
  && tar xzf ${FILENAME}.tar.gz \
  && mv ${FILENAME}/oauth2-proxy /app/ \
  && rm -rf ${FILENAME}*

RUN chown -R appuser:appgroup /app

USER appuser

ENTRYPOINT ./oauth2-proxy
