pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "vimukthi1406/my-first-web:latest"
        DOCKER_HUB_CREDS = "docker-hub-credentials-id" 
    }
    stages {
        stage('Checkout') {
            steps { checkout scm }
        }
        stage('Build Docker Image') {
            steps { sh "docker build -t ${DOCKER_IMAGE} ." }
        }
        stage('Push to Docker Hub') {
            steps {
                // withDockerRegistry handles the 'docker login' for you
                withDockerRegistry([credentialsId: "${DOCKER_HUB_CREDS}", url: ""]) {
                    sh "docker push ${DOCKER_IMAGE}"
                }
            }
        }
        stage('Deploy') {
            steps {
                sh "docker stop my-web-container || true"
                sh "docker rm my-web-container || true"
                sh "docker run -d --name my-web-container -p 8081:80 ${DOCKER_IMAGE}"
            }
        }
    }
}