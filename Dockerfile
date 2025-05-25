# Use a base image
FROM nginx:alpine

# Copy static website files to nginx default public folder
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80
