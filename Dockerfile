FROM openjdk:8-jdk-alpine as build

COPY . .

RUN ./gradlew build

FROM openjdk:8-jre-alpine

#Copy application jar to the image
COPY /build/libs/worker-0.0.1-SNAPSHOT.jar .

EXPOSE 8081

ENTRYPOINT java -jar worker-0.0.1-SNAPSHOT.jar