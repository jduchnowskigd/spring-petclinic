#Build stage

FROM gradle:7.6.1-jdk17 AS BUILD
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN ./gradlew build


FROM openjdk:17-alpine

EXPOSE 8080
RUN mkdir /app
COPY --from=build /home/gradle/src/build/libs/*.jar /app/spring-petclinic.jar
WORKDIR /app
ENTRYPOINT ["java", "-jar", "spring-petclinic.jar"]
