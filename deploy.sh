#!/bin/bash

echo "Building image..."
docker build -t mywebapp .

echo "Stopping old container..."
docker stop mycontainer || true
docker rm mycontainer || true

echo "Running new container..."
docker run -d -p 8080:80 --name mycontainer mywebapp

echo "Deployment complete 🚀"