FROM kawaii/spigot-builder:1.13.2 as BUILD

FROM openjdk:11-jre-slim
LABEL maintainer="Kane Valentine <kane@cute.im>"

WORKDIR /opt/spigot/

COPY --from=BUILD /src/build/spigot/spigot-1.13.2.jar /usr/bin/spigot-1.13.2.jar

COPY docker-entrypoint.sh /usr/local/bin/

VOLUME ["/opt/spigot/", "/srv/spigot/plugins/"]

EXPOSE 25565
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["java", "-Xmx1024M", "-Xms1024M", "-jar", "/usr/bin/spigot-1.13.2.jar", "nogui"]
