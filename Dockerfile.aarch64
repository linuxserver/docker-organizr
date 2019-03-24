FROM lsiobase/nginx:arm64v8-3.9

# set version label
ARG ORGANIZR_COMMIT
ARG BUILD_DATE
ARG VERSION

LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="sparklyballs, homerr"

RUN \
echo "**** install runtime packages ****" && \
apk add --no-cache --upgrade \
	curl \
	php7-curl \
	php7-ldap \
	php7-pdo_sqlite \
	php7-sqlite3 \
	php7-zip && \
echo "**** fetch organizr ****" && \
mkdir -p\
	/var/www/html && \
if [ -z ${ORGANIZR_COMMIT+x} ]; then \
	ORGANIZR_COMMIT=$(curl -sX GET "https://api.github.com/repos/causefx/Organizr/branches/v1-master" \
	| awk '/sha/{print $4;exit}' FS='[""]'); \
fi && \
curl -o \
	/tmp/organizr.tar.gz -L \
	"https://github.com/causefx/Organizr/archive/${ORGANIZR_COMMIT}.tar.gz" && \
tar xf \
	/tmp/organizr.tar.gz -C \
	/var/www/html/ --strip-components=1 && \
echo "**** cleanup ****" && \
rm -rf \
	/root/.composer 

# add local files
COPY root/ /

# ports and volumes
VOLUME /config
