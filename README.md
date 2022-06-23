# beardedtek-com/tailscale

Tailscale container that acts as a subnet router for a docker network.

It uses a script to scrape the container's docker network and automatically enable --advertise-routes

add this service under services to add tailscale functionality to the docker network

```
    # Provides tailscale functionality for the stack

  tailscale:
    image: beardedtek-com/tailscale:dev
    container_name: tailscale
    restart: unless-stopped
    privileged: true
    volumes:
      - ./varlib:/var/lib
      - /dev/net/tun:/dev/net/tun
    cap_add:
      - net_admin
      - sys_module
    environment:
      - TAILSCALE_AUTHKEY=${TAILSCALE_AUTHKEY}
      - TAILSCALE_HOSTNAME=${TAILSCALE_HOSTNAME}
      - TAILSCALE_TAGS=${TAILSCALE_TAGS}
      - TAILSCALE_ADVERTISE_ROUTE=${TAILSCALE_ADVERTISE_ROUTE}
      - TAILSCALE_ENABLE=#{TAILSCALE_ENABLE:-true}
```

Values can be set in a .env file:
```
# Obtain tailscale auth key from:
# https://login.tailscale.com/admin/settings/keys
TAILSCALE_AUTH_KEY=tskey-XXXXXXXXXXXX-XXXXXXXXXXXXXXXXXXXXX
TAILSCALE_HOSTNAME=sidecar-service
TAILSCALE_TAGS=
TAILSCALE_ADVERTISE_ROUTE=
TAILSCALE_ENABLE=true
```