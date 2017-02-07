FROM lsiobase/alpine.nginx:3.5
MAINTAINER sparklyballs

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# install packages
RUN \
 apk add --no-cache \
	php7-pdo_sqlite \
	php7-sqlite3 \
	php7-session

# add local files
COPY root/ /

# ports and volumes
EXPOSE 80
VOLUME /config
