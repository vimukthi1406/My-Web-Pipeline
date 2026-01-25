# Step 1: Use the Nginx web server as a base
FROM nginx:alpine

# Step 2: Copy your file into the server's web folder
# We rename it to index.html so Nginx knows it is the home page
COPY my1.html /usr/share/nginx/html/index.html

# Step 3: Tell Docker the container will use port 80
EXPOSE 80