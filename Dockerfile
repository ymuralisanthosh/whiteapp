# Use a base image with OpenJDK
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Expose the port (adjust if your application uses a different port)
EXPOSE 8080

# Command to run your app
CMD ["java", "-jar", "application.jar"]

