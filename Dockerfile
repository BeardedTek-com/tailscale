FROM docker.beardedtek.com/beardedtek-com/fevr-base:latest
COPY rootfs /
RUN apk --no-cache add tailscale python3-dev build-base \
        linux-headers pcre-dev \
&&  rm -rf /fevr/app /fevr/venv \
&&  python3 -m venv /venv \
&&  source /venv/bin/activate \
&&  pip install netifaces \
&&  apk --no-cache del python3-dev build-base linux-headers \
        pcre-dev \
&&  chmod +x /etc/services.d/* 
