FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /app
COPY backend/java-app/pom.xml ./pom.xml
COPY backend/java-app/src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=build /app/target/marketai-suite-1.0.0-SNAPSHOT.jar app.jar
EXPOSE 10000
CMD ["sh", "-c", "java -Dserver.port=${PORT:-10000} -jar app.jar"]
