ARG SPIGOT_VERSION

FROM kawaii/spigot-builder:${SPIGOT_VERSION} as BUILD

FROM openjdk:12-jdk-alpine

ARG BUILD_AUTHORS
ARG BUILD_DATE
ARG SPIGOT_VERSION

LABEL org.opencontainers.image.authors=$BUILD_AUTHORS \
      org.opencontainers.image.created=$BUILD_DATE \
      org.opencontainers.image.version=$SPIGOT_VERSION

WORKDIR /opt/spigot/

COPY --from=BUILD /src/build/spigot/spigot-${SPIGOT_VERSION}.jar /usr/bin/spigot.jar

COPY docker-entrypoint.sh /usr/local/bin/

VOLUME ["/opt/spigot/", "/srv/spigot/plugins/"]

EXPOSE 25565
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["java", "-Xmx2048M", "-Xms2048M", "-jar", "/usr/bin/spigot.jar", "--plugins=/srv/spigot/plugins/", "nogui"]
