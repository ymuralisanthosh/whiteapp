# Use a base image with OpenJDK
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Copy the latest artifact into the container
COPY /var/lib/jenkins/workspace/Whiteapp/target/*.war /app/application.war

# Expose the port (adjust if your application uses a different port)
EXPOSE 9080

# Command to run your application
CMD ["java", "-jar", "application.war"]

