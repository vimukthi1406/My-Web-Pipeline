pipeline {
    agent any

    environment {
        // Your exact Docker Hub repository name
        DOCKER_IMAGE = "vimukthi1406/my-first-web:latest"
        // This MUST match the 'ID' you gave your credentials in Jenkins settings
        DOCKER_HUB_CREDS = "docker-hub-credentials-id" 
    }

    stages {
        stage('Checkout') {
            steps {
                // Pulls your code (my1.html, Dockerfile) from GitHub
                checkout scm 
            }
        }

        stage('Build Docker Image') {
            steps {
                // Packages your HTML into a Docker image
                sh "docker build -t ${DOCKER_IMAGE} ." 
            }
        }

        stage('Push to Docker Hub') {
            steps {
                // Logs into Docker Hub and uploads the image
                withDockerRegistry([credentialsId: "${DOCKER_HUB_CREDS}", url: ""]) {
                    sh "docker push ${DOCKER_IMAGE}"
                }
            }
        }

        stage('Deploy') {
            steps {
                // Cleans up old versions and starts the new website on port 8081
                sh "docker stop my-web-container || true"
                sh "docker rm my-web-container || true"
                sh "docker run -d --name my-web-container -p 8081:80 ${DOCKER_IMAGE}"
            }
        }
    }
}