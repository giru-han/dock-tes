# Use an official Python runtime as the base image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Copy the .env file into the container
COPY .env /app/.env

# Install any needed dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install Nginx
#RUN apt-get update && apt-get install -y nginx && apt-get clean

# Remove the default Nginx configuration file
#RUN rm /etc/nginx/sites-enabled/default

# Copy the Nginx configuration file
#COPY nginx.conf /etc/nginx/nginx.conf

# Make the entrypoint script executable
# RUN chmod +x entrypoint.sh
RUN chmod +x /app/entrypoint.sh && sed -i 's/\r$//' /app/entrypoint.sh

# Set environment variable
ENV SCRIPT_NAME=mex.py

# Expose the ports for Nginx and Flask
EXPOSE 80 5000

# Run the entrypoint script
CMD ["bash", "/app/entrypoint.sh"]
