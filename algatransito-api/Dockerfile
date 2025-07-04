
FROM alpine:3.17
RUN apk add --no-cache openjdk17-jre
WORKDIR /algaworkspace
ENV JAR_NAME=algatransito-api.jar
COPY target/$JAR_NAME $JAR_NAME
ENTRYPOINT java -jar $JAR_NAME