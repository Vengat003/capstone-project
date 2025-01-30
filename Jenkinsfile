pipeline {
    agent any
    stages {
         stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t vengat001/dev:latest .'
                }
            }
        }
        stage('Push to DockerHub') {
            steps {
                script {
                    // Login to DockerHub using the Personal Access Token
                    sh "docker login -u $DOCKER_CREDENTIALS_USR -p $DOCKER_CREDENTIALS_PSWD"
                    
                    // Push images to DockerHub
                    sh 'docker push vengat001/dev:latest'
                }
            }
        }
    }
}

