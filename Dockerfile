# Use an official Python runtime as the base image
#FROM python:3.10-slim
#FROM python:latest
FROM python:slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app
# COPY .env /app/.env

# Install any needed dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install Nginx
RUN apt-get update && apt-get install -y nginx && apt-get clean

# Remove the default Nginx configuration file
RUN rm /etc/nginx/sites-enabled/default

# Copy the main Nginx configuration file
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Copy your site-specific configuration file
COPY nginx/sites-available/nginx.conf /etc/nginx/sites-available/nginx.conf

# Create a symbolic link to enable the site-specific configuration
RUN ln -sf /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf

# change the domain name to copy SSL certificates
COPY ssl/fullchain.pem /etc/letsencrypt/live/example.com/fullchain.pem
COPY ssl/privkey.pem /etc/letsencrypt/live/example.com/privkey.pem

# Make the entrypoint script executable
# RUN chmod +x entrypoint.sh
RUN chmod +x /app/entrypoint.sh && sed -i 's/\r$//' /app/entrypoint.sh

# Set environment variable
#ENV SCRIPT_NAME=mex.py

# Expose the ports for Nginx and Flask
EXPOSE 443

# Run the entrypoint script
CMD ["bash", "/app/entrypoint.sh"]