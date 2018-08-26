FROM kawaii/spigot-builder:1.12.2 as BUILD

FROM openjdk:10-jre-slim
MAINTAINER Kane Valentine <kane@cute.im>

WORKDIR /opt/spigot/
COPY --from=BUILD /src/build/spigot/spigot-1.12.2.jar /opt/spigot/spigot-1.12.2.jar

COPY docker-entrypoint.sh /usr/local/bin/

EXPOSE 25565
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["java", "-Xmx1024M", "-Xms1024M", "-jar", "spigot-1.12.2.jar", "nogui"]
