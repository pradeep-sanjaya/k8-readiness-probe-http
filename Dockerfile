FROM openjdk:8-jre-alpine
WORKDIR /app
COPY target/k8-readyness-probe-1.0.jar /app/application.jar
ENTRYPOINT ["java", "-jar", "/app/application.jar"]