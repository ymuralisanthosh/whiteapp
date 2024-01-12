# Use an official OpenJDK runtime as a base image
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Copy the white-app JAR file into the container at /app
COPY white-app.jar /app/white-app.jar

# Specify the command to run on container startup
CMD ["java", "-jar", "white-app.jar"]

