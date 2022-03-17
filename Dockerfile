FROM maven:3.8.4-jdk-11
COPY . /usr/src/vrspace
WORKDIR /usr/src/vrspace
RUN apt-get update
RUN cd /usr/src/vrspace/server

# Skipping tests should be harmless ;-x
RUN mvn clean install -DskipTests

CMD ["java", \
    "--add-opens", "java.base/java.lang=ALL-UNNAMED", \
    "--add-opens", "java.base/java.nio=ALL-UNNAMED", \
    "--add-opens", "java.base/java.io=ALL-UNNAMED", \
    "--add-opens", "java.base/java.util=ALL-UNNAMED", \
    "--add-opens", "java.base/java.util.concurrent=ALL-UNNAMED", \
    "--add-opens", "java.base/sun.net.www.protocol.http=ALL-UNNAMED", \
    "--add-opens", "java.base/sun.nio.ch=ALL-UNNAMED", \
    "-jar", \
    "/usr/src/vrspace/server/target/server-0.4.5-SNAPSHOT.jar"]
