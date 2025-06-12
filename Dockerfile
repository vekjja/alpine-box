FROM alpine:latest

RUN apk add --no-cache \
    curl \
    jq \
    netcat-openbsd

COPY profile /etc/profile
