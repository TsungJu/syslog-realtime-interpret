FROM maven:3-openjdk-8-slim AS BUILD
COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn package

FROM openjdk:8-alpine AS RUNTIME
RUN apk update && apk add --no-cache libc6-compat
RUN ln -s /lib64/ld-linux-x86-64.so.2 /lib/ld-linux-x86-64.so.2
WORKDIR /app/
COPY --from=BUILD /tmp/target/kafka.streams.messages-0.0.1-SNAPSHOT.jar .
ENTRYPOINT ["java", "-cp", "kafka.streams.messages-0.0.1-SNAPSHOT.jar", "syslog.realtime.interpret.kafka.streams.messages.LineSplit"]
