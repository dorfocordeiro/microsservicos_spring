FROM maven:3.8.6-openjdk-11-slim AS mvnbuild
WORKDIR /algaworkspace
COPY . .
RUN mvn clean package -DskipTests


FROM alpine:3.17
RUN apk add --no-cache openjdk17-jre
WORKDIR /algaworkspace
ENV JAR_NAME=algatransito-api.jar
COPY --from=mvnbuild /algaworkspace/target/$JAR_NAME $JAR_NAME
CMD java -jar $JAR_NAME