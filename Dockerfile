FROM ubuntu:22.04

WORKDIR /usr/src/app

ARG version=1.20.4

# Add UTF-8 support
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

# Perform https://www.spigotmc.org/wiki/buildtools/
RUN apt-get update && apt-get install -y git wget openjdk-17-jdk
RUN wget -O BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
# RUN git config --global --unset core.autocrlf
RUN java -jar BuildTools.jar --rev $version && \
  mv spigot-${version}.jar spigot.jar

CMD [ "sh", "-c", "mv -n ./spigot.jar ./server/spigot.jar; cd server; exec java -jar -Xms1G -Xmx8G spigot.jar" ]
