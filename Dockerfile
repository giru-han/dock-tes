# Use an official Python runtime as the base image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set environment variable
ENV SCRIPT_NAME=mex.py

# Run the script when the container launches
CMD ["bash", "entrypoint.sh"]
