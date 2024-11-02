# Stage 1: Build the Flutter web app
FROM debian:latest AS build-env

# Install necessary tools
RUN apt-get update && apt-get install -y curl git unzip

# Define variables
ARG FLUTTER_SDK=/usr/local/flutter
ARG FLUTTER_VERSION=3.24.3
ARG APP=/app

# Clone the Flutter SDK from GitHub and checkout the specific version
RUN git clone https://github.com/flutter/flutter.git $FLUTTER_SDK
RUN cd $FLUTTER_SDK && git fetch && git checkout $FLUTTER_VERSION

# Set Flutter and Dart SDK path
ENV PATH="$FLUTTER_SDK/bin:$FLUTTER_SDK/bin/cache/dart-sdk/bin:${PATH}"

# Run flutter doctor to check for any issues
RUN flutter doctor -v

# Create a folder for the app and set it as the working directory
RUN mkdir $APP
WORKDIR $APP

# Copy rclone_flutter and rclone_client folders into the Docker image
COPY rclone_flutter ./rclone_flutter
COPY rclone_client ./rclone_client

# Move into the rclone_flutter directory to build the web app
WORKDIR /app/rclone_flutter

# Run Flutter clean, get dependencies, and build the web app
RUN flutter clean
RUN flutter pub get
RUN flutter build web

# Stage 2: Serve the web app using Nginx
FROM nginx:1.25.2-alpine

# Copy the custom Nginx configuration file
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy the built web app to Nginx's HTML directory
COPY --from=build-env /app/rclone_flutter/build/web /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Run Nginx
CMD ["nginx", "-g", "daemon off;"]
