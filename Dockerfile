# Use a base image with OpenJDK
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Copy the JAR file into the container
COPY application.jar .

# Expose the application port
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "application.jar"]

