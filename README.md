[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)](https://linuxserver.io)

The [LinuxServer.io](https://linuxserver.io) team brings you another container release featuring :-

 * regular and timely application updates
 * easy user mappings (PGID, PUID)
 * custom base image with s6 overlay
 * weekly base OS updates with common layers across the entire LinuxServer.io ecosystem to minimise space usage, down time and bandwidth
 * regular security updates

Find us at:
* [Discord](https://discord.gg/YWrKVTn) - realtime support / chat with the community and the team.
* [IRC](https://irc.linuxserver.io) - on freenode at `#linuxserver.io`. Our primary support channel is Discord.
* [Blog](https://blog.linuxserver.io) - all the things you can do with our containers including How-To guides, opinions and much more!
* [Podcast](https://anchor.fm/linuxserverio) - on hiatus. Coming back soon (late 2018).

# PSA: Changes are happening

From August 2018 onwards, Linuxserver are in the midst of switching to a new CI platform which will enable us to build and release multiple architectures under a single repo. To this end, existing images for `arm64` and `armhf` builds are being deprecated. They are replaced by a manifest file in each container which automatically pulls the correct image for your architecture. You'll also be able to pull based on a specific architecture tag.

TLDR: Multi-arch support is changing from multiple repos to one repo per container image.

# [linuxserver/organizr](https://github.com/linuxserver/docker-organizr)
[![](https://img.shields.io/discord/354974912613449730.svg?logo=discord&label=LSIO%20Discord&style=flat-square)](https://discord.gg/YWrKVTn)
[![](https://images.microbadger.com/badges/version/linuxserver/organizr.svg)](https://microbadger.com/images/linuxserver/organizr "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/linuxserver/organizr.svg)](https://microbadger.com/images/linuxserver/organizr "Get your own version badge on microbadger.com")
![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/organizr.svg)
![Docker Stars](https://img.shields.io/docker/stars/linuxserver/organizr.svg)
[![Build Status](https://ci.linuxserver.io/buildStatus/icon?job=Docker-Pipeline-Builders/docker-organizr/master)](https://ci.linuxserver.io/job/Docker-Pipeline-Builders/job/docker-organizr/job/master/)
[![](https://lsio-ci.ams3.digitaloceanspaces.com/linuxserver/organizr/latest/badge.svg)](https://lsio-ci.ams3.digitaloceanspaces.com/linuxserver/organizr/latest/index.html)

[Organizr](https://github.com/causefx/Organizr) is a HTPC/Homelab Services Organizer - Written in PHP

Do you have quite a bit of services running on your computer or server? 
Do you have a lot of bookmarks or have to memorize a bunch of ip's and ports? 
Well, Organizr is here to help with that. Organizr allows you to setup "Tabs" that will be loaded all in one webpage. 
You can then work on your server with ease. You can even open up two tabs side by side. 
Want to give users access to some Tabs? No problem, just enable user support and have them make an account. 
Want guests to be able to visit too? Enable Guest support for those tabs.

For more information on Organizr and information on how to use it visit their site at https://github.com/causefx/Organizr


[![organizr](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/organizr-icon.png)](https://github.com/causefx/Organizr)

## Supported Architectures

Our images support multiple architectures such as `x86-64`, `arm64` and `armhf`. We utilise the docker manifest for multi-platform awareness. More information is available from docker [here](https://github.com/docker/distribution/blob/master/docs/spec/manifest-v2-2.md#manifest-list). 

Simply pulling `linuxserver/organizr` should retrieve the correct image for your arch, but you can also pull specific arch images via tags.

The architectures supported by this image are:

| Architecture | Tag |
| :----: | --- |
| x86-64 | amd64-latest |
| arm64 | arm64v8-latest |
| armhf | arm32v6-latest |


## Usage

Here are some example snippets to help you get started creating a container.

### docker

```
docker create \
  --name=organizr \
  -e PUID=1001 \
  -e PGID=1001 \
  -e TZ=<your timezone, eg Europe/London> \
  -p 9983:80 \
  -v <path to data>:/config \
  --restart unless-stopped \
  linuxserver/organizr
```


### docker-compose

Compatible with docker-compose v2 schemas.

```
---
version: "2"
services:
  organizr:
    image: linuxserver/organizr
    container_name: organizr
    environment:
      - PUID=1001
      - PGID=1001
      - TZ=<your timezone, eg Europe/London>
    volumes:
      - <path to data>:/config
    ports:
      - 9983:80
    mem_limit: 4096m
    restart: unless-stopped
```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 80` | will map the container's port 80 to port 9983 on the host |
| `-e PUID=1001` | for UserID - see below for explanation |
| `-e PGID=1001` | for GroupID - see below for explanation |
| `-e TZ=<your timezone, eg Europe/London>` | for specifying your timezone |
| `-v /config` | this is where your user data and logs will live |

## User / Group Identifiers

When using volumes (`-v` flags) permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.

In this instance `PUID=1001` and `PGID=1001`, to find yours use `id user` as below:

```
  $ id username
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```


&nbsp;
## Application Setup

Dead simple to get running, create the container as instructed and start it. When up and running, load the site.

Leave the path as default and set your timezone - you're done!



## Support Info

* Shell access whilst the container is running: `docker exec -it organizr /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f organizr`
* container version number 
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' organizr`
* image version number
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' linuxserver/organizr`

## Updating Info

Most of our images are static, versioned, and require an image update and container recreation to update the app inside. With some exceptions (ie. nextcloud, plex), we do not recommend or support updating apps inside the container. Please consult the [Application Setup](#application-setup) section above to see if it is recommended for the image.  
  
Below are the instructions for updating containers:  
  
### Via Docker Run/Create
* Update the image: `docker pull linuxserver/organizr`
* Stop the running container: `docker stop organizr`
* Delete the container: `docker rm organizr`
* Recreate a new container with the same docker create parameters as instructed above (if mapped correctly to a host folder, your `/config` folder and settings will be preserved)
* Start the new container: `docker start organizr`
* You can also remove the old dangling images: `docker image prune`

### Via Docker Compose
* Update the image: `docker-compose pull linuxserver/organizr`
* Let compose update containers as necessary: `docker-compose up -d`
* You can also remove the old dangling images: `docker image prune`

## Versions

* **11.02.19:** - Fix permissions on new app location
* **31.12.18:** - Moved to pipeline building from v1-master branch
* **05.09.18:** - Rebase to Alpine 3.8
* **10.01.18:** - Rebase to Alpine 3.7
* **25.05.17:** - Rebase to Alpine 3.6
* **02.05.17:** - Added php7-curl package
* **12.04.17:** - Added php7-ldap package
* **10.03.18:** - Initial Release.
