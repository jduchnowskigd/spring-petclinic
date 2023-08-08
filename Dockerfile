#Build stage

# Use a Maven base image from Docker Hub
FROM maven:latest as BUILD
WORKDIR /app
COPY pom.xml /app/
COPY src /app/src/
RUN mvn install

FROM openjdk:17-alpine
EXPOSE 8080
RUN mkdir /app
COPY --from=build /app/target/*.jar /app/spring-petclinic.jar
WORKDIR /app
ENTRYPOINT ["java", "-jar", "spring-petclinic.jar"]