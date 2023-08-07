#Build stage

# Use a Maven base image from Docker Hub
FROM maven:latest as BUILD
WORKDIR /app
COPY pom.xml /app/
COPY src /app/src/
RUN mvn install

