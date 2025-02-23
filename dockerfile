# Use the official nginx image as the base image
FROM nginx:alpine

# Set the working directory inside the container
WORKDIR /usr/share/nginx/html

# Copy the static website files (HTML, CSS, JS) to the nginx HTML directory
COPY . .

# Expose port 80 for HTTP traffic
EXPOSE 80

# The nginx image already starts the nginx server, so no need for a CMD or RUN instruction