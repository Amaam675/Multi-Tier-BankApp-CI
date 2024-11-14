FROM eclipse-temurin:17-jdk-alpine AS build
    
EXPOSE 8080
 
ENV APP_HOME /usr/src/app

COPY target/*.jar $APP_HOME/app.jar

WORKDIR $APP_HOME
FROM scratch
COPY --from=build /usr/src/app/app.jar app.jar

CMD ["java", "-jar", "app.jar"]
