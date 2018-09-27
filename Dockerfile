FROM kawaii/spigot-builder:1.13.1 as BUILD

FROM openjdk:10-jre-slim
MAINTAINER Kane Valentine <kane@cute.im>

WORKDIR /opt/spigot/
COPY --from=BUILD /src/build/spigot/spigot-1.13.1.jar /opt/spigot/spigot-1.13.1.jar

COPY docker-entrypoint.sh /usr/local/bin/

EXPOSE 25565
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["java", "-Xmx1024M", "-Xms1024M", "-jar", "spigot-1.13.1.jar", "nogui"]
