#!/bin/bash

echo "Building image..."
docker build -t mywebapp .

echo "Stopping old containers..."
docker stop $(docker ps -q) 2>/dev/null || true
docker rm $(docker ps -aq) 2>/dev/null || true

echo "Running new container..."
docker run -d -p 8080:80 --name mycontainer mywebapp

echo "Deployment complete 🚀"
