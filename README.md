Fork of the LSIO Organizr Docker container to include the Organizr v2 development branch.

# tronyx/docker-organizr-v2:plex-theme

Feel free to submit Pull Requests and report any Issues that you may have found.

## Organizr

An HTPC/Homelab services organizer that is written in PHP.

![organizr](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/organizr-icon.png)

## Usage

```
docker create \
  --name=organizr \
  -v <path to data>:/config \
  -e PGID=<gid> -e PUID=<uid>  \
  -p 80:80 \
  tronyx/docker-organizr-v2
```

## Parameters

The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side. For example with a port -p external:internal - what this shows is the port mapping from internal to external of the container. So `-p 8080:80` would expose port 80 from inside the container to be accessible from the host's IP on port 8080 and `http://192.168.x.x:8080` would show you what's running INSIDE the container on port 80.

* `-p 80` - The port(s)
* `-v /config` - Mapping the config files for Organizr
* `-e PGID` Used for GroupID - see below for explanation
* `-e PUID` Used for UserID - see below for explanation

It is based on Alpine Linux with an s6 overlay.

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Image Tags

* The `latest` tag will get you the original Organizr v2 image.
* The `plex` tag will get you the original Organizr v2 image, but with some changes found in the plex-theme branch of the GitHub repo to accommodate the [Plex Theme](https://github.com/Burry/organizr-v2-plex-theme) for Organizr v2 by Burry.

## Setting up the application

Setup accounts, service tabs, etc. via the webUI. More info can be found on the official [Organizr GitHub repository](https://github.com/causefx/Organizr/).

## Info

* Shell access whilst the container is running: `docker exec -it organizr /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f organizr`
* Container version number: `docker inspect -f '{{ index .Config.Labels "build_version" }}' organizr`
* Image version number: `docker inspect -f '{{ index .Config.Labels "build_version" }}' tronyx/docker-organizr-v2`
